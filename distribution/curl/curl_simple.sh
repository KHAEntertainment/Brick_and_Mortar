#!/bin/bash
"""
Brick & Mortar Simple CURL Script

Pure bash script for slicer post-processing integration.
Requires only CURL (no Python).

Usage: ./curl_simple.sh input.gcode output.gcode [API_URL]
"""

# Configuration
DEFAULT_API_URL="http://localhost:9000"
TIMEOUT=60

# Functions
print_usage() {
    echo "Usage: $0 input.gcode output.gcode [API_URL]"
    echo ""
    echo "Examples:"
    echo "  $0 input.gcode output.gcode"
    echo "  $0 input.gcode output.gcode http://localhost:9000"
    echo "  $0 input.gcode output.gcode https://bm-api.khaent.com"
    echo ""
    echo "Environment variables:"
    echo "  BM_API_URL - API base URL (default: $DEFAULT_API_URL)"
    echo "  BM_TIMEOUT - Request timeout in seconds (default: $TIMEOUT)"
}

check_dependencies() {
    if ! command -v curl &> /dev/null; then
        echo "ERROR: curl is required but not installed"
        exit 1
    fi
    
    if ! command -v jq &> /dev/null; then
        echo "WARNING: jq not found - output will be less formatted"
    fi
}

check_api_health() {
    local api_url="$1"
    local health_response
    
    health_response=$(curl -s -m "$TIMEOUT" "$api_url/api/health" 2>/dev/null)
    
    if [[ $? -eq 0 ]] && echo "$health_response" | grep -q '"status":"healthy"'; then
        return 0
    else
        return 1
    fi
}

process_gcode() {
    local input_file="$1"
    local output_file="$2"
    local api_url="$3"
    
    echo "🔄 Processing G-code via API..."
    
    # Call API
    local response
    response=$(curl -s -m "$TIMEOUT" \
        -X POST \
        -F "file=@$input_file" \
        -F "material_preset=PETG_TPU" \
        -F "z_offset=0.1" \
        -F "xy_shift=0.2" \
        -F "mortar_temp=225" \
        -F "enable_preview=false" \
        "$api_url/api/process" 2>/dev/null)
    
    if [[ $? -ne 0 ]]; then
        echo "ERROR: API request failed"
        return 1
    fi
    
    # Check if response indicates success
    if echo "$response" | grep -q '"success":true'; then
        # Extract processed G-code (this is a simplified extraction)
        # In a real implementation, you'd want better JSON parsing
        echo "$response" | sed -n 's/.*"processed_gcode":"\([^"]*\)".*/\1/p' | sed 's/\\n/\n/g' > "$output_file"
        
        if [[ -f "$output_file" ]] && [[ -s "$output_file" ]]; then
            echo "✅ Processing complete"
            
            # Try to extract stats if jq is available
            if command -v jq &> /dev/null; then
                local mortar_layers
                mortar_layers=$(echo "$response" | jq -r '.processing_stats.mortar_layers_added // 0' 2>/dev/null)
                if [[ "$mortar_layers" != "null" ]] && [[ "$mortar_layers" != "0" ]]; then
                    echo "   - Mortar layers added: $mortar_layers"
                fi
            fi
            
            echo "💾 Saved to: $output_file"
            return 0
        else
            echo "ERROR: Failed to save processed G-code"
            return 1
        fi
    else
        echo "ERROR: API processing failed"
        if command -v jq &> /dev/null; then
            local error_msg
            error_msg=$(echo "$response" | jq -r '.error // "Unknown error"' 2>/dev/null)
            echo "   $error_msg"
        fi
        return 1
    fi
}

# Main script
main() {
    # Parse arguments
    if [[ $# -lt 2 ]] || [[ $# -gt 3 ]]; then
        print_usage
        exit 1
    fi
    
    local input_file="$1"
    local output_file="$2"
    local api_url="${3:-${BM_API_URL:-$DEFAULT_API_URL}}"
    
    # Override timeout if set
    if [[ -n "$BM_TIMEOUT" ]]; then
        TIMEOUT="$BM_TIMEOUT"
    fi
    
    echo "🧱 Brick & Mortar CURL Processor"
    echo "================================="
    
    # Check dependencies
    check_dependencies
    
    # Check input file
    if [[ ! -f "$input_file" ]]; then
        echo "ERROR: Input file not found: $input_file"
        exit 1
    fi
    
    echo "📁 Input: $input_file"
    echo "📁 Output: $output_file"
    echo "🌐 API: $api_url"
    
    # Check API health
    echo "🔍 Checking API health..."
    if check_api_health "$api_url"; then
        echo "✅ API healthy"
    else
        echo "ERROR: API not accessible at $api_url"
        echo "Make sure the Brick & Mortar API is running"
        exit 1
    fi
    
    # Process G-code
    if process_gcode "$input_file" "$output_file" "$api_url"; then
        echo ""
        echo "🎉 Brick & Mortar processing complete!"
        exit 0
    else
        echo ""
        echo "❌ Processing failed"
        exit 1
    fi
}

# Run main function
main "$@"