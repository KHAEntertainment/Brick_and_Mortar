#!/bin/bash

# Brick & Mortar API Background Startup Script
# Starts the API in the background and returns to terminal

echo "🚀 Starting Brick & Mortar API in background..."
echo "=============================================="

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR"

# Check if API is already running
if curl -s http://localhost:9000/api/health > /dev/null 2>&1; then
    echo "✅ API is already running!"
    echo "   Health check: $(curl -s http://localhost:9000/api/health)"
    exit 0
fi

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found!"
    echo "   Please run: python3 -m venv venv && venv/bin/pip install -r requirements.txt"
    exit 1
fi

# Start the API in background
echo "🎯 Starting API in background..."
nohup venv/bin/python main.py > api.log 2>&1 &
API_PID=$!

# Wait a moment for startup
sleep 3

# Check if it started successfully
if curl -s http://localhost:9000/api/health > /dev/null 2>&1; then
    echo "✅ API started successfully!"
    echo "   PID: $API_PID"
    echo "   Local access:    http://localhost:9000"
    echo "   Network access:  http://$(ipconfig getifaddr en0):9000"
    echo "   External access: http://28.2.225.48:9000"
    echo "   Logs:           tail -f api.log"
    echo ""
    echo "   To stop: kill $API_PID"
    echo "   Or use: ./stop_api.sh"
else
    echo "❌ API failed to start!"
    echo "   Check logs: cat api.log"
    exit 1
fi