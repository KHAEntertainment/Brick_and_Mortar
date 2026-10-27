#!/bin/bash

# Brick & Mortar API Stop Script
# Safely stops the running API

echo "🛑 Stopping Brick & Mortar API..."
echo "================================="

# Check if API is running
if ! curl -s http://localhost:9000/api/health > /dev/null 2>&1; then
    echo "⚠️  API is not running"
    exit 0
fi

echo "🔍 Finding API process..."

# Find and kill the API process
API_PIDS=$(pgrep -f "python.*main.py")

if [ -z "$API_PIDS" ]; then
    echo "⚠️  No API process found"
    exit 0
fi

echo "🎯 Stopping API processes: $API_PIDS"

# Kill the processes gracefully
for pid in $API_PIDS; do
    echo "   Stopping PID: $pid"
    kill $pid
done

# Wait a moment
sleep 2

# Check if still running, force kill if necessary
REMAINING_PIDS=$(pgrep -f "python.*main.py")
if [ ! -z "$REMAINING_PIDS" ]; then
    echo "🔨 Force stopping remaining processes..."
    pkill -9 -f "python.*main.py"
    sleep 1
fi

# Verify it's stopped
if curl -s http://localhost:9000/api/health > /dev/null 2>&1; then
    echo "❌ API is still running! Manual intervention required."
    exit 1
else
    echo "✅ API stopped successfully"
fi