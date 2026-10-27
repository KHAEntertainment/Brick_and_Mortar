"""
API Middleware

Middleware components for the API.
"""

from .cors_config import add_cors_middleware, get_cors_origins

__all__ = ["add_cors_middleware", "get_cors_origins"]