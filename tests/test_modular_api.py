#!/usr/bin/env python3
"""
Modular API Validation Test

Tests the new modular API to ensure it maintains compatibility with the original.
"""

import sys
import os
import asyncio
import requests
import json
import time

# Add project root to path
sys.path.insert(0, os.path.dirname(__file__))

def test_health_endpoint():
    """Test health endpoint"""
    print("Testing health endpoint...")
    
    try:
        response = requests.get("http://localhost:9000/api/health", timeout=5)
        
        if response.status_code == 200:
            data = response.json()
            assert data["status"] == "healthy"
            assert data["version"] == "2.0.0"
            assert data["architecture"] == "modular"
            print("   ✅ Health endpoint working")
            print(f"   Version: {data['version']}, Architecture: {data['architecture']}")
            return True
        else:
            print(f"   ❌ Health endpoint failed: {response.status_code}")
            return False
    except Exception as e:
        print(f"   ❌ Health endpoint error: {e}")
        return False

def test_gcode_validation():
    """Test G-code validation endpoint"""
    print("\nTesting G-code validation...")
    
    # Create test G-code file
    test_gcode = """
; BambuStudio 1.9.0
G28 ; home all axes
G1 Z0.2 F600
;LAYER_CHANGE
M991 S0 P1 ; notify layer change 1
G1 X10 Y10 E0.1 F1800
G1 X20 Y10 E0.2 F1800
G1 X20 Y20 E0.3 F1800
""".strip()
    
    try:
        files = {"file": ("test.gcode", test_gcode, "text/plain")}
        response = requests.post("http://localhost:9000/api/validate", files=files, timeout=10)
        
        if response.status_code == 200:
            data = response.json()
            assert data["valid"] == True
            assert data["slicer_format"] == "bambu"
            assert data["compatible"] == True
            print("   ✅ G-code validation working")
            print(f"   Slicer: {data['slicer_format']}, Compatible: {data['compatible']}")
            return True
        else:
            print(f"   ❌ Validation failed: {response.status_code}")
            print(f"   Response: {response.text}")
            return False
    except Exception as e:
        print(f"   ❌ Validation error: {e}")
        return False

def test_gcode_processing():
    """Test G-code processing endpoint"""
    print("\nTesting G-code processing...")
    
    # Create test G-code file
    test_gcode = """
; BambuStudio 1.9.0
G28 ; home all axes
G1 Z0.2 F600
;LAYER_CHANGE
M991 S0 P1 ; notify layer change 1
G1 X10 Y10 E0.1 F1800
G1 X20 Y10 E0.2 F1800
G1 X20 Y20 E0.3 F1800
G1 Z0.4 F600
M991 S0 P2 ; notify layer change 2
G1 X10 Y20 E0.4 F1800
G1 X10 Y10 E0.5 F1800
""".strip()
    
    try:
        files = {"file": ("test.gcode", test_gcode, "text/plain")}
        data = {
            "material_preset": "PETG_TPU",
            "z_offset": 0.1,
            "xy_shift": 0.2,
            "enable_preview": True
        }
        
        response = requests.post("http://localhost:9000/api/process", files=files, data=data, timeout=15)
        
        if response.status_code == 200:
            result = response.json()
            assert result["success"] == True
            assert "processed_gcode" in result
            assert "processing_stats" in result
            assert result["processing_stats"]["mortar_layers_added"] > 0
            
            # Check for mortar layer markers
            processed_gcode = result["processed_gcode"]
            assert "BRICK_MORTAR_LAYER" in processed_gcode
            assert "T1" in processed_gcode  # Tool change to mortar
            assert "T0" in processed_gcode  # Tool change back
            
            print("   ✅ G-code processing working")
            print(f"   Mortar layers added: {result['processing_stats']['mortar_layers_added']}")
            print(f"   Original lines: {result['processing_stats']['original_lines']}")
            print(f"   Processed lines: {result['processing_stats']['processed_lines']}")
            return True
        else:
            print(f"   ❌ Processing failed: {response.status_code}")
            print(f"   Response: {response.text}")
            return False
    except Exception as e:
        print(f"   ❌ Processing error: {e}")
        return False

def test_preview_generation():
    """Test preview generation endpoint"""
    print("\nTesting preview generation...")
    
    # Simple test G-code
    test_gcode = """
; BambuStudio 1.9.0
G1 X10 Y10 Z0.2 E0.1
G1 X20 Y10 E0.2
M991 S0 P1 ; notify layer change
""".strip()
    
    try:
        files = {"file": ("test.gcode", test_gcode, "text/plain")}
        response = requests.post("http://localhost:9000/api/preview", files=files, timeout=10)
        
        if response.status_code == 200:
            data = response.json()
            assert "file_info" in data
            assert data["file_info"]["slicer_format"] == "bambu"
            print("   ✅ Preview generation working")
            print(f"   Slicer format: {data['file_info']['slicer_format']}")
            return True
        else:
            print(f"   ❌ Preview failed: {response.status_code}")
            return False
    except Exception as e:
        print(f"   ❌ Preview error: {e}")
        return False

def test_image_endpoints():
    """Test image processing endpoints (basic checks)"""
    print("\nTesting image processing endpoints...")
    
    try:
        # Test single process endpoint with mock data
        mock_request = {
            "materialId": "test-123",
            "materialName": "Test Material",
            "imageUrl": "https://via.placeholder.com/200x200.jpg",
            "supabaseConfig": {
                "url": "https://test.supabase.co",
                "serviceRoleKey": "test-key",
                "bucket": "materials"
            }
        }
        
        response = requests.post(
            "http://localhost:9000/api/image-processing/single-process", 
            json=mock_request, 
            timeout=10
        )
        
        # We expect this to fail with mock credentials, but endpoint should respond
        if response.status_code in [200, 500]:  # Either success or expected failure
            print("   ✅ Image processing endpoints responding")
            return True
        else:
            print(f"   ❌ Image endpoints unexpected status: {response.status_code}")
            return False
            
    except Exception as e:
        print(f"   ❌ Image endpoints error: {e}")
        return False

def check_api_running():
    """Check if API is running"""
    print("Checking if modular API is running...")
    
    try:
        response = requests.get("http://localhost:9000/", timeout=5)
        if response.status_code == 200:
            data = response.json()
            if data.get("architecture") == "modular":
                print("   ✅ Modular API is running")
                return True
            else:
                print("   ❌ API running but not modular version")
                return False
        else:
            print(f"   ❌ API not responding: {response.status_code}")
            return False
    except Exception as e:
        print(f"   ❌ Cannot connect to API: {e}")
        print("   Please start the modular API with: python3 main_modular.py")
        return False

def main():
    """Run all tests"""
    print("🧪 Modular API Validation Tests")
    print("=" * 50)
    
    # Check if API is running
    if not check_api_running():
        print("\n❌ API not running. Please start with: python3 main_modular.py")
        return False
    
    # Run tests
    tests = [
        test_health_endpoint,
        test_gcode_validation,
        test_gcode_processing,
        test_preview_generation,
        test_image_endpoints
    ]
    
    passed = 0
    total = len(tests)
    
    for test in tests:
        try:
            if test():
                passed += 1
        except Exception as e:
            print(f"   ❌ Test failed with exception: {e}")
    
    print(f"\n📊 Results: {passed}/{total} tests passed")
    
    if passed == total:
        print("🎉 All tests passed! Modular API is working correctly.")
        return True
    else:
        print("❌ Some tests failed. Check the API implementation.")
        return False

if __name__ == "__main__":
    success = main()
    sys.exit(0 if success else 1)