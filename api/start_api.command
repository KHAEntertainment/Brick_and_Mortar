#!/bin/bash

# Brick & Mortar API Startup Script (macOS .command version)
# Double-click this file to start the API

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
    echo "Press any key to keep existing API, or close window to exit..."
    read -n 1
    exit 0
fi

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "❌ Virtual environment not found!"
    echo "   Please run the setup first"
    echo ""
    echo "Press any key to exit..."
    read -n 1
    exit 1
fi

# Start the API
echo "🎯 Starting Brick & Mortar API..."
echo "   Local access:    http://localhost:9000"
echo "   Network access:  http://$(ipconfig getifaddr en0):9000" 
echo "   External access: http://28.2.225.48:9000"
echo ""
echo "   The API is now running!"
echo "   Close this window to stop the API"
echo "=================================="

# Keep the terminal window open and run the API
venv/bin/python main.py

echo ""
echo "🛑 API has stopped"
echo "Press any key to close this window..."
read -n 1