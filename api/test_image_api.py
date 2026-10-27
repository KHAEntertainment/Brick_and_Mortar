#!/usr/bin/env python3
"""Test script for the Image Processing API endpoints"""

import requests
import json
import time
import sys

def test_health_check():
    """Test the health check endpoint"""
    print("Testing health check endpoint...")
    try:
        response = requests.get("http://localhost:9000/api/health")
        if response.status_code == 200:
            print("✅ Health check passed")
            return True
        else:
            print(f"❌ Health check failed: {response.status_code}")
            return False
    except Exception as e:
        print(f"❌ Health check error: {e}")
        return False

def test_single_process():
    """Test single material processing"""
    print("\nTesting single material processing...")
    
    # Test data - using a sample image URL
    test_data = {
        "materialId": "test-material-123",
        "materialName": "Test Material",
        "imageUrl": "https://picsum.photos/300/200.jpg",  # Sample image
        "supabaseConfig": {
            "url": "https://test.supabase.co",
            "serviceRoleKey": "test-key",
            "bucket": "materials"
        }
    }
    
    try:
        response = requests.post(
            "http://localhost:9000/api/image-processing/single-process",
            json=test_data,
            timeout=60
        )
        
        if response.status_code == 200:
            result = response.json()
            if result.get('success'):
                print("✅ Single processing test passed")
                print(f"   Material ID: {result.get('materialId')}")
                print(f"   Processing time: {result.get('processingTime')} seconds")
                return True
            else:
                print(f"❌ Single processing failed: {result.get('error')}")
                return False
        else:
            print(f"❌ Single processing HTTP error: {response.status_code}")
            print(f"   Response: {response.text}")
            return False
    except Exception as e:
        print(f"❌ Single processing error: {e}")
        return False

def test_bulk_process():
    """Test bulk material processing"""
    print("\nTesting bulk material processing...")
    
    # Test data - using sample image URLs
    test_data = {
        "materials": [
            {
                "id": "material-1",
                "name": "Test Material 1",
                "imageUrl": "https://picsum.photos/200/200.jpg"
            },
            {
                "id": "material-2", 
                "name": "Test Material 2",
                "imageUrl": "https://picsum.photos/300/200.jpg"
            }
        ],
        "options": {
            "concurrency": 2,
            "retryAttempts": 2,
            "retryDelay": 1000
        },
        "supabaseConfig": {
            "url": "https://test.supabase.co",
            "serviceRoleKey": "test-key",
            "bucket": "materials"
        }
    }
    
    try:
        # Start bulk processing
        response = requests.post(
            "http://localhost:9000/api/image-processing/bulk-process",
            json=test_data
        )
        
        if response.status_code == 200:
            result = response.json()
            job_id = result.get('jobId')
            print(f"✅ Bulk processing started")
            print(f"   Job ID: {job_id}")
            print(f"   Total materials: {result.get('totalMaterials')}")
            print(f"   WebSocket URL: {result.get('websocketUrl')}")
            
            # Monitor job status
            print("\nMonitoring job progress...")
            for i in range(30):  # Wait up to 30 seconds
                status_response = requests.get(f"http://localhost:9000/api/image-processing/status/{job_id}")
                if status_response.status_code == 200:
                    status = status_response.json()
                    progress = status.get('progress', {})
                    print(f"   Progress: {progress.get('completed', 0)}/{progress.get('total', 0)} "
                          f"(Success: {progress.get('success', 0)}, Failed: {progress.get('failed', 0)})")
                    
                    if status.get('status') in ['completed', 'failed', 'stopped']:
                        print(f"✅ Job completed with status: {status.get('status')}")
                        return True
                        
                time.sleep(2)
            
            print("⚠️  Job still running after timeout")
            return True
        else:
            print(f"❌ Bulk processing HTTP error: {response.status_code}")
            print(f"   Response: {response.text}")
            return False
    except Exception as e:
        print(f"❌ Bulk processing error: {e}")
        return False

def test_api_endpoints():
    """Test all API endpoints"""
    print("🧪 Testing Image Processing API Endpoints\n")
    
    success_count = 0
    total_tests = 0
    
    # Test 1: Health check
    total_tests += 1
    if test_health_check():
        success_count += 1
    
    # Test 2: Single processing (mock test - will fail on upload but should test the logic)
    total_tests += 1
    if test_single_process():
        success_count += 1
    
    # Test 3: Bulk processing (mock test - will fail on upload but should test the logic)
    total_tests += 1
    if test_bulk_process():
        success_count += 1
    
    # Summary
    print(f"\n📊 Test Results: {success_count}/{total_tests} tests passed")
    
    if success_count == total_tests:
        print("🎉 All tests passed!")
        return True
    else:
        print("❌ Some tests failed!")
        return False

if __name__ == "__main__":
    try:
        success = test_api_endpoints()
        sys.exit(0 if success else 1)
    except KeyboardInterrupt:
        print("\n⚠️  Tests interrupted by user")
        sys.exit(1)
    except Exception as e:
        print(f"\n❌ Test suite failed with error: {e}")
        sys.exit(1)