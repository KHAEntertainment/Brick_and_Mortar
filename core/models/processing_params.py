"""
Processing Parameters Model

Unified parameter model for all distribution methods.
"""

from typing import Optional
from dataclasses import dataclass

@dataclass
class ProcessingParams:
    """Parameters for G-code processing"""
    
    # Material configuration
    material_preset: str = "PETG_TPU"
    base_tool: str = "T0"
    alt_tool: str = "T1"
    
    # Layer configuration
    z_offset: float = 0.1          # Mid-layer Z offset (mm)
    xy_shift: float = 0.2          # Brick pattern X/Y offset (mm)
    layer_height: Optional[float] = None  # Auto-detected if None
    
    # Tool settings
    mortar_temp: int = 225         # T1 nozzle temperature (°C)
    mortar_speed: int = 100        # T1 speed percentage
    mortar_fan_speed: int = 128    # T1 fan speed (0-255)
    
    # Processing options
    extrusion_multiplier: float = 1.05  # Mortar extrusion factor
    enable_preview: bool = True         # Generate preview data
    enable_tool_settings: bool = True   # Include tool change commands
    
    # Advanced options
    enable_top_bottom_layers: bool = False  # Future expansion
    debug_mode: bool = False               # Verbose output
    
    def __post_init__(self):
        """Validate parameters after initialization"""
        if self.z_offset <= 0:
            raise ValueError("z_offset must be positive")
        if self.extrusion_multiplier <= 0:
            raise ValueError("extrusion_multiplier must be positive")
        if not (0 <= self.mortar_speed <= 200):
            raise ValueError("mortar_speed must be between 0-200%")
        if not (150 <= self.mortar_temp <= 300):
            raise ValueError("mortar_temp must be between 150-300°C")
    
    @classmethod
    def from_preset(cls, preset_name: str) -> "ProcessingParams":
        """Create parameters from material preset"""
        presets = {
            "PETG_TPU": cls(
                material_preset="PETG_TPU",
                mortar_temp=225,
                z_offset=0.1,
                xy_shift=0.2,
                extrusion_multiplier=1.05
            ),
            "PLA_PETG": cls(
                material_preset="PLA_PETG", 
                mortar_temp=240,
                z_offset=0.08,
                xy_shift=0.15,
                extrusion_multiplier=1.02
            ),
            "ABS_TPU": cls(
                material_preset="ABS_TPU",
                mortar_temp=230,
                z_offset=0.12,
                xy_shift=0.25,
                extrusion_multiplier=1.08
            )
        }
        
        if preset_name not in presets:
            raise ValueError(f"Unknown preset: {preset_name}")
        
        return presets[preset_name]
    
    def to_dict(self):
        """Convert to dictionary for JSON serialization"""
        return {
            "material_preset": self.material_preset,
            "base_tool": self.base_tool,
            "alt_tool": self.alt_tool,
            "z_offset": self.z_offset,
            "xy_shift": self.xy_shift,
            "layer_height": self.layer_height,
            "mortar_temp": self.mortar_temp,
            "mortar_speed": self.mortar_speed,
            "mortar_fan_speed": self.mortar_fan_speed,
            "extrusion_multiplier": self.extrusion_multiplier,
            "enable_preview": self.enable_preview,
            "enable_tool_settings": self.enable_tool_settings,
            "enable_top_bottom_layers": self.enable_top_bottom_layers,
            "debug_mode": self.debug_mode
        }
    
    @classmethod
    def from_dict(cls, data: dict) -> "ProcessingParams":
        """Create from dictionary"""
        return cls(**data)