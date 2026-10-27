"""
WebSocket Connection Manager

Manages WebSocket connections for real-time updates.
"""

from fastapi import WebSocket, WebSocketDisconnect
from typing import Dict, List
import json

class ConnectionManager:
    """WebSocket connection manager"""
    
    def __init__(self):
        self.active_connections: Dict[str, List[WebSocket]] = {}

    async def connect(self, websocket: WebSocket, job_id: str):
        """Connect a WebSocket for a specific job"""
        await websocket.accept()
        if job_id not in self.active_connections:
            self.active_connections[job_id] = []
        self.active_connections[job_id].append(websocket)

    def disconnect(self, websocket: WebSocket, job_id: str):
        """Disconnect a WebSocket"""
        if job_id in self.active_connections:
            try:
                self.active_connections[job_id].remove(websocket)
                if not self.active_connections[job_id]:
                    del self.active_connections[job_id]
            except ValueError:
                pass  # WebSocket not in list

    async def send_update(self, job_id: str, message: dict):
        """Send update to all connections for a job"""
        if job_id in self.active_connections:
            disconnected = []
            for connection in self.active_connections[job_id]:
                try:
                    await connection.send_text(json.dumps(message))
                except:
                    disconnected.append(connection)
            
            # Clean up disconnected connections
            for connection in disconnected:
                self.disconnect(connection, job_id)

# Global connection manager instance
manager = ConnectionManager()