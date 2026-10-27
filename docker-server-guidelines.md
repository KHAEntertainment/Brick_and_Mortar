# Docker Deployment Standards & Patterns

## 🏗️ Infrastructure Setup

### Environment Details
- **Platform**: UGreen DXP4800+
- **Local Network IP**: 192.168.1.165
- **Local Hostname**: khaent-nas1
- **Agent Access**: Will supply you with MCP tools to connect and manage (not yet implemented)
- **Docker Root**: `/volume1/@docker`
- **User Home**: `/volume1/homes/[username]`
- **Development Base**: `~/development/projects`
- **Stack Configs**: `~/development/docker/stacks`

### Network Architecture
- **Primary Network**: `php-dev-stack_dev-network` (overlay, attachable)
- **Pattern**: All services connect to this shared network
- **Traefik**: Handles all routing via this network

## 🌐 Domain & Port Standards

### Domain Structure
- **Local Access**: `service.nas1` (e.g., `php83.nas1`, `pma.nas1`)
- **Internet Access**: `service.khaent.com` or `subdomain.khaent.com`
- **MCP Services**: `mcp.nas1` prefix for MCP-related services
- **Management**: `pt-mcp.nas1` for alternate Portainer instances

### Port Allocation Strategy
**Range 10000-19999 for services to avoid conflicts**

#### Established Ports
- **80**: HTTP (Traefik)
- **443/8443**: HTTPS (8443 to avoid NAS conflict)
- **8080**: Traefik Dashboard
- **9000**: Portainer EE
- **9001**: Portainer CE (for MCP)
- **3010**: Puppeteer/Browserless
- **3020**: MCP Bridge Server
- **5432**: PostgreSQL (direct access)
- **13306**: MariaDB (high port to avoid conflicts)
- **18080**: phpMyAdmin
- **18025**: Mailhog UI

### Port Selection Rules
1. Check existing services: `netstat -tlnp | grep :PORT`
2. Use high ports (10000+) for development services
3. Keep databases on non-standard ports for security
4. Document all port assignments

## 📦 Stack Configuration Standards

### YAML Structure
```yaml
version: '3.8'

services:
  service-name:
    image: image:tag
    environment:
      - ENV_VAR=${ENV_VAR:-default-value}
    volumes:
      - ${PATH_VAR:-/default/path}:/container/path
      - named-volume:/data
    deploy:
      labels:
        - "traefik.enable=true"
        - "traefik.http.routers.service.rule=Host(`service.nas1`)"
        - "traefik.http.services.service.loadbalancer.server.port=80"
      restart_policy:
        condition: any
        delay: 5s
    networks:
      - dev-network

networks:
  dev-network:
    external: true
    name: php-dev-stack_dev-network

volumes:
  named-volume:
```

### Service Naming Convention
- **Development prefix**: `dev-servicename` (when needed to avoid conflicts)
- **Hyphenated names**: `php-83` not `php83` for service names
- **Descriptive suffixes**: `-ui`, `-api`, `-worker`

## 🔒 Security Standards

### Secrets Management
- **Use Docker Secrets** for sensitive data
- **Pattern**: `service_password` (e.g., `db_password`, `postgres_password`)
- **Never hardcode** passwords in stack files
- **Environment variables** for non-sensitive config

### Secret Reference Pattern
```yaml
environment:
  - SOME_PASSWORD_FILE=/run/secrets/secret_name
secrets:
  - secret_name

# At bottom of file:
secrets:
  secret_name:
    external: true
```

### Internet Exposure Rules
- **Always require auth**: Admin tools (phpMyAdmin, pgAdmin, Portainer)
- **Consider auth**: Development servers, APIs
- **Public OK**: Production apps (intentionally public)
- **Never expose**: Databases, Redis, internal services

### Basic Auth Pattern
```yaml
- "traefik.http.middlewares.auth.basicauth.users=admin:$$2y$$10$$..."
- "traefik.http.routers.service-secure.middlewares=auth"
```

## 🚀 Deployment Standards

### Stack Deployment via Portainer
1. **Environment Variables**: Define at deployment, not in stack
2. **Stack Naming**: `purpose-type` (e.g., `php-dev`, `supabase-dev`)
3. **Always specify** external networks with full name
4. **Health checks** for critical services

### Environment Variable Pattern
```yaml
# In stack file
${VARIABLE_NAME:-default-value}

# In Portainer deployment
VARIABLE_NAME=actual-value
```

### Common Environment Variables
```
PROJECT_PATH=/home/docker/development/projects
DOMAIN_SUFFIX=nas1
DB_PASSWORD=(from secret)
API_TOKEN=(from secret)
```

## 🏷️ Traefik Routing Standards

### Local Access (Always Present)
```yaml
- "traefik.enable=true"
- "traefik.http.routers.service.rule=Host(`service.nas1`)"
- "traefik.http.services.service.loadbalancer.server.port=80"
- "traefik.http.routers.service.entrypoints=web"
```

### Internet Access (When Needed)
```yaml
- "traefik.http.routers.service-secure.rule=Host(`service.khaent.com`)"
- "traefik.http.routers.service-secure.entrypoints=websecure"
- "traefik.http.routers.service-secure.tls=true"
- "traefik.http.routers.service-secure.tls.certresolver=letsencrypt"
- "traefik.http.routers.service-secure.service=service"
- "traefik.http.routers.service-secure.middlewares=auth,security-headers"
```

### Router Naming Convention
- **Local**: `servicename`
- **Secure/Internet**: `servicename-secure`
- **Special purpose**: `servicename-purpose` (e.g., `service-public`, `service-admin`)

## 📁 Volume Standards

### Named Volumes Pattern
```yaml
volumes:
  servicename-data:    # Data persistence
  servicename-config:  # Configuration
  servicename-cache:   # Temporary/cache data
```

### Bind Mounts
- **Development code**: `${PROJECT_PATH:-./projects}:/app`
- **Use variables** for paths that might change
- **Absolute paths** for Synology: `/volume1/...`

## 🔧 Service Configuration Patterns

### Database Services
```yaml
mariadb:
  image: mariadb:latest
  environment:
    MYSQL_ROOT_PASSWORD_FILE: /run/secrets/db_root_password
    MYSQL_DATABASE: ${DB_NAME:-development}
    MYSQL_USER: ${DB_USER:-developer}
    MYSQL_PASSWORD_FILE: /run/secrets/db_password
  volumes:
    - mariadb-data:/var/lib/mysql
  secrets:
    - db_root_password
    - db_password
  deploy:
    labels:
      - "traefik.enable=false"  # Never expose DBs
```

### Application Services
```yaml
app:
  image: app:latest
  environment:
    - NODE_ENV=development
    - DATABASE_URL_FILE=/run/secrets/database_url
  volumes:
    - ${PROJECT_PATH:-./projects}:/app
    - app-modules:/app/node_modules  # Prevent overwrite
  deploy:
    labels:
      - "traefik.enable=true"
      - "traefik.http.routers.app.rule=Host(`app.nas1`)"
```

### Handling Missing Files
```yaml
command: ["sh", "-c", "if [ -f package.json ]; then npm install && npm run dev; else echo 'No package.json found' && tail -f /dev/null; fi"]
```

## 🌉 MCP Integration Standards

### MCP Server Types
1. **stdio-based**: For Claude Desktop/Code (local process)
2. **HTTP-based**: For Gemini CLI and network access
3. **Bridge pattern**: HTTP endpoints wrapped for stdio

### MCP Configuration Pattern
```json
{
  "mcpServers": {
    "service": {
      "command": "node",
      "args": ["/path/to/mcp-server/index.js"],
      "env": {
        "SERVICE_URL": "http://service.nas1:port",
        "SERVICE_TOKEN": "token"
      }
    }
  }
}
```

## 📝 Documentation Standards

### Stack Documentation Structure
1. **Purpose & Overview**
2. **Services Included** (with brief description)
3. **Port Mappings** (clearly listed)
4. **Required Secrets** (what to create)
5. **Environment Variables** (with defaults)
6. **Access URLs** (local and internet if applicable)
7. **First-Time Setup** (if needed)
8. **Security Notes** (what not to expose)

### Comment Standards
```yaml
# Section headers
# === INTERNET EXPOSURE OPTIONS (UNCOMMENT WHEN READY) ===

# Inline explanations
- "8443:8443"  # Changed from 443 to avoid NAS conflict

# Warnings
# NEVER expose database to internet!
```

## 🔄 Update Patterns

### Adding Services to Existing Stacks
1. Maintain network connectivity
2. Follow port allocation rules
3. Add to volumes section if needed
4. Update documentation

### Safe Update Process
1. Test with single service first
2. Use staging for SSL certs
3. Always backup before major changes
4. Monitor logs during deployment

## 🎯 Quick Reference Commands

### Debugging
```bash
# Check port availability
netstat -tlnp | grep :PORT

# View service logs
docker service logs STACK_SERVICE --tail 50

# Check network connectivity
docker network ls | grep dev

# Verify secret exists
docker secret ls
```

### Common Fixes
```bash
# Remove failed service
docker service rm STACK_SERVICE

# Force network removal
docker network rm NETWORK --force

# Check actual container
docker ps | grep SERVICE
```

## 🚦 Service Start Order

1. **Traefik** (routing infrastructure)
2. **Databases** (PostgreSQL, MariaDB)
3. **Core Services** (auth, storage)
4. **Application Services**
5. **Development Tools** (adminer, phpMyAdmin)

## 📋 Template Principles

### For Portainer Templates
- **No environment variables** - use hardcoded with placeholders
- **Search/Replace markers** - clear what to change
- **Self-contained** - no external dependencies
- **Comments at top** - what to modify

### Template Header Pattern
```yaml
# ============================================
# TEMPLATE CONFIGURATION - EDIT THESE VALUES
# ============================================
# SEARCH AND REPLACE:
# - PROJECT_PATH: /home/docker/development/projects
# - DOMAIN_SUFFIX: nas1
# - YOUR_EMAIL: admin@example.com
# ============================================
```

---

These standards ensure consistency across all deployments and make it easy to add new services following established patterns.



