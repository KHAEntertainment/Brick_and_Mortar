#!/bin/bash

# Brick & Mortar API Startup Script
# For easy API restart after system reboots

echo "🚀 Starting Brick & Mortar API..."
echo "=================================="

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

echo "📁 Working directory: $SCRIPT_DIR"

# Check if API is already running
if curl -s http://localhost:9000/api/health > /dev/null 2>&1; then
    echo "⚠️  API is already running!"
    echo "   Health check: $(curl -s http://localhost:9000/api/health)"
    echo ""
    read -p "Do you want to restart it? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "✅ Keeping existing API running"
        exit 0
    fi
    
    echo "🔄 Stopping existing API..."
    # Kill any existing Python processes running on port 9000
    pkill -f "python.*main.py" || true
    sleep 2
fi

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found!"
    echo "   Please run: python3 -m venv venv && venv/bin/pip install -r requirements.txt"
    exit 1
fi

# Check if dependencies are installed
if [ ! -f "venv/lib/python*/site-packages/fastapi" ]; then
    echo "📦 Installing dependencies..."
    venv/bin/pip install -r requirements.txt
fi

# Start the API
echo "🎯 Starting Brick & Mortar API on port 9000..."
echo "   Local access:    http://localhost:9000"
echo "   Network access:  http://$(ipconfig getifaddr en0):9000"
echo "   External access: http://28.2.225.48:9000"
echo ""
echo "   Press Ctrl+C to stop the API"
echo "=================================="

# Run in foreground so you can see logs and stop with Ctrl+C
venv/bin/python main.py