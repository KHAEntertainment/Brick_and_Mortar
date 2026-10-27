#!/bin/bash

# Brick & Mortar API Status Check Script
# Quickly check if the API is running and accessible

echo "🔍 Checking Brick & Mortar API Status..."
echo "========================================"

# Check local access
echo "📡 Testing local access..."
if curl -s http://localhost:9000/api/health > /dev/null 2>&1; then
    HEALTH_RESPONSE=$(curl -s http://localhost:9000/api/health)
    echo "✅ Local:     http://localhost:9000 - HEALTHY"
    echo "   Response: $HEALTH_RESPONSE"
else
    echo "❌ Local:     http://localhost:9000 - NOT ACCESSIBLE"
fi

# Check network access
echo ""
echo "🌐 Testing network access..."
NETWORK_IP=$(ipconfig getifaddr en0 2>/dev/null || echo "unknown")
if [ "$NETWORK_IP" != "unknown" ]; then
    if curl -s http://$NETWORK_IP:9000/api/health > /dev/null 2>&1; then
        echo "✅ Network:   http://$NETWORK_IP:9000 - HEALTHY"
    else
        echo "❌ Network:   http://$NETWORK_IP:9000 - NOT ACCESSIBLE"
    fi
else
    echo "⚠️  Network:   Could not determine network IP"
fi

# Check external access
echo ""
echo "🌍 Testing external access..."
if curl -s --connect-timeout 5 http://28.2.225.48:9000/api/health > /dev/null 2>&1; then
    echo "✅ External:  http://28.2.225.48:9000 - HEALTHY"
else
    echo "❌ External:  http://28.2.225.48:9000 - NOT ACCESSIBLE"
fi

# Check process status
echo ""
echo "⚙️  Process information..."
API_PIDS=$(pgrep -f "python.*main.py")
if [ ! -z "$API_PIDS" ]; then
    echo "✅ API Process(es) running: $API_PIDS"
    for pid in $API_PIDS; do
        echo "   PID $pid: $(ps -p $pid -o comm= -o args= | head -1)"
    done
else
    echo "❌ No API processes found"
fi

echo ""
echo "========================================"