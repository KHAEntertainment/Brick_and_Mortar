"""
Brick & Mortar API - Modular Version

Modular FastAPI application using extracted core processing logic.

Version: 2.0.0
"""

from fastapi import FastAPI
import os
import uvicorn

# Import modular components
from endpoints.gcode_endpoints import router as gcode_router
from endpoints.image_endpoints import router as image_router
from websocket.websocket_endpoints import router as websocket_router
from middleware.cors_config import add_cors_middleware, get_cors_origins

# Environment configuration
ENVIRONMENT = os.getenv("ENVIRONMENT", "development")

# Port configuration with validation
def get_port():
    """Get port from environment with validation"""
    # Check for specific Brick & Mortar port first, then fallback to generic PORT
    port_str = os.getenv("BRICK_MORTAR_PORT") or os.getenv("PORT", "9000")
    
    try:
        port = int(port_str)
        if not (1024 <= port <= 65535):
            print(f"⚠️  Warning: Port {port} outside recommended range (1024-65535), using default 9000")
            return 9000
        return port
    except ValueError:
        print(f"⚠️  Warning: Invalid port '{port_str}', using default 9000")
        return 9000

PORT = get_port()

# Port conflict detection
def check_port_availability(port):
    """Check if port is available (basic check)"""
    import socket
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        try:
            s.bind(('localhost', port))
            return True
        except OSError:
            return False

# Create FastAPI app
app = FastAPI(
    title="Brick & Mortar API", 
    version="2.0.0",
    description="Modular G-Code Processing & Image Management API"
)

# Add CORS middleware
cors_origins = add_cors_middleware(app)

# Include routers
app.include_router(gcode_router)
app.include_router(image_router)
app.include_router(websocket_router)

@app.get("/api/health")
async def health_check():
    """Health check endpoint"""
    return {
        "status": "healthy", 
        "service": "brick-mortar-api",
        "version": "2.0.0",
        "architecture": "modular",
        "environment": ENVIRONMENT,
        "port": {
            "current": PORT,
            "configured_via": "BRICK_MORTAR_PORT" if os.getenv("BRICK_MORTAR_PORT") else "PORT" if os.getenv("PORT") else "default",
            "alternative_ports": [8000, 3000, 8080, 8888] if PORT != 9000 else [8000, 3000, 8080, 8888, 9001]
        },
        "cors_origins": cors_origins if ENVIRONMENT == "development" else "configured"
    }

@app.get("/")
async def root():
    """Root endpoint"""
    return {
        "service": "Brick & Mortar API",
        "version": "2.0.0",
        "architecture": "modular",
        "status": "running",
        "documentation": "/docs"
    }

if __name__ == "__main__":
    print(f"🚀 Starting Brick & Mortar API v2.0.0")
    print(f"📡 Environment: {ENVIRONMENT}")
    print(f"🔌 Port: {PORT}")
    
    # Check port availability
    if not check_port_availability(PORT):
        print(f"⚠️  Port {PORT} appears to be in use!")
        print(f"💡 Try setting BRICK_MORTAR_PORT to an alternative port:")
        print(f"   export BRICK_MORTAR_PORT=8080")
        print(f"   export BRICK_MORTAR_PORT=3000")
        print(f"   export BRICK_MORTAR_PORT=9001")
        print(f"🔍 Current process using port {PORT}:")
        os.system(f"lsof -i :{PORT} || netstat -tulpn | grep :{PORT}")
        print(f"\n🔄 Attempting to start anyway...")
    
    print(f"📖 API Documentation: http://localhost:{PORT}/docs")
    print(f"❤️  Health Check: http://localhost:{PORT}/api/health")
    print("-" * 60)
    
    uvicorn.run(app, host="0.0.0.0", port=PORT)