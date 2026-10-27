# Brick & Mortar API - Startup Scripts

Easy-to-use scripts for managing your Brick & Mortar API after system restarts or reboots.

## 🚀 Available Scripts

### `start_api.sh` - Interactive Startup
```bash
./start_api.sh
```
- **Use**: Terminal startup with interactive prompts
- **Features**: 
  - Checks if API is already running
  - Asks before restarting existing API
  - Shows startup logs in real-time
  - Stop with `Ctrl+C`
- **Best for**: Development and troubleshooting

### `start_api.command` - Double-Click Startup
```bash
Double-click this file in Finder
```
- **Use**: GUI startup for macOS
- **Features**:
  - Double-click to start
  - Keeps terminal window open
  - Close window to stop API
- **Best for**: Quick startup without terminal

### `start_api_background.sh` - Background Startup
```bash
./start_api_background.sh
```
- **Use**: Start API in background, return to terminal
- **Features**:
  - Runs API as background process
  - Creates `api.log` for logs
  - Returns PID for later stopping
  - Non-blocking terminal
- **Best for**: Production-like running

### `stop_api.sh` - Safe Shutdown
```bash
./stop_api.sh
```
- **Use**: Safely stop the running API
- **Features**:
  - Graceful shutdown attempt
  - Force kill if needed
  - Verification of shutdown
- **Best for**: Clean API shutdown

### `status_api.sh` - Status Check
```bash
./status_api.sh
```
- **Use**: Check if API is running and accessible
- **Features**:
  - Tests local, network, and external access
  - Shows process information
  - Quick health verification
- **Best for**: Troubleshooting connectivity

## 📋 Quick Reference

| Task | Command |
|------|---------|
| **Start API (development)** | `./start_api.sh` |
| **Start API (background)** | `./start_api_background.sh` |
| **Start API (GUI)** | Double-click `start_api.command` |
| **Stop API** | `./stop_api.sh` |
| **Check Status** | `./status_api.sh` |

## 🌐 Access URLs

After starting, your API will be available at:
- **Local**: `http://localhost:9000`
- **Network**: `http://192.168.1.79:9000`
- **External**: `http://28.2.225.48:9000`

## 🔧 After System Restart

1. Open Terminal
2. Navigate to the API directory:
   ```bash
   cd "/Users/bbrenner/Documents/Scripting Projects/Brick and Mortar/api"
   ```
3. Choose your startup method:
   ```bash
   ./start_api_background.sh    # Background
   # OR
   ./start_api.sh              # Interactive
   ```
4. Verify it's working:
   ```bash
   ./status_api.sh
   ```

## 🎯 For Lovable Integration

After startup, use this URL in your frontend:
```
http://28.2.225.48:9000
```

All scripts include automatic health checks and clear status messages to ensure everything is working correctly.