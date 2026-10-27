"""
CORS Configuration

Environment-based CORS configuration for the API.
"""

import os
from fastapi.middleware.cors import CORSMiddleware

def get_cors_origins():
    """Get CORS origins based on environment configuration"""
    cors_origins = os.getenv("CORS_ORIGINS", "")
    
    if cors_origins:
        # Production: use specified origins
        return [origin.strip() for origin in cors_origins.split(",") if origin.strip()]
    elif os.getenv("ENVIRONMENT", "development") == "production":
        # Production fallback: secure defaults
        return [
            "https://bm-api.khaent.com",
            "https://app.khaent.com",
            "http://bm-api.nas1"
        ]
    else:
        # Development: allow all origins
        return ["*"]

def add_cors_middleware(app):
    """Add CORS middleware to FastAPI app"""
    cors_origins = get_cors_origins()
    app.add_middleware(
        CORSMiddleware,
        allow_origins=cors_origins,
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )
    return cors_origins