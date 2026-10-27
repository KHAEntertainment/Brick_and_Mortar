"""
WebSocket Endpoints

WebSocket endpoints for real-time communication.
"""

from fastapi import APIRouter, WebSocket, WebSocketDisconnect
from .websocket_manager import manager

router = APIRouter()

@router.websocket("/ws/{job_id}")
async def websocket_endpoint(websocket: WebSocket, job_id: str):
    """WebSocket endpoint for real-time progress updates"""
    await manager.connect(websocket, job_id)
    try:
        while True:
            # Keep connection alive
            await websocket.receive_text()
    except WebSocketDisconnect:
        manager.disconnect(websocket, job_id)