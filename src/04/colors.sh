#!/usr/bin/bash

# colors.sh - Color management for system info script

# Function to get color name from number
get_color_name() {
    case $1 in
        1) echo "white" ;;
        2) echo "red" ;;
        3) echo "green" ;;
        4) echo "blue" ;;
        5) echo "purple" ;;
        6) echo "black" ;;
        *) echo "unknown" ;;
    esac
}

# Default color values
DEFAULT_COL1_BG=6
DEFAULT_COL1_FONT=1
DEFAULT_COL2_BG=6
DEFAULT_COL2_FONT=1

# Read configuration and set display values
read_config() {
    local config_file="color.conf"

    # Initialize with defaults
    COL1_BG_VALUE=$DEFAULT_COL1_BG
    COL1_FONT_VALUE=$DEFAULT_COL1_FONT
    COL2_BG_VALUE=$DEFAULT_COL2_BG
    COL2_FONT_VALUE=$DEFAULT_COL2_FONT

    # Track what came from config vs defaults
    COL1_BG_FROM_CONFIG=false
    COL1_FONT_FROM_CONFIG=false
    COL2_BG_FROM_CONFIG=false
    COL2_FONT_FROM_CONFIG=false

    # Read from config file if it exists
    if [ -f "$config_file" ]; then
        if grep -q "column1_background=" "$config_file"; then
            COL1_BG_VALUE=$(grep "column1_background=" "$config_file" | cut -d= -f2)
            COL1_BG_FROM_CONFIG=true
        fi

        if grep -q "column1_font_color=" "$config_file"; then
            COL1_FONT_VALUE=$(grep "column1_font_color=" "$config_file" | cut -d= -f2)
            COL1_FONT_FROM_CONFIG=true
        fi

        if grep -q "column2_background=" "$config_file"; then
            COL2_BG_VALUE=$(grep "column2_background=" "$config_file" | cut -d= -f2)
            COL2_BG_FROM_CONFIG=true
        fi

        if grep -q "column2_font_color=" "$config_file"; then
            COL2_FONT_VALUE=$(grep "column2_font_color=" "$config_file" | cut -d= -f2)
            COL2_FONT_FROM_CONFIG=true
        fi
    fi

    # Export values for use by other scripts
    export COL1_BG_VALUE COL1_FONT_VALUE COL2_BG_VALUE COL2_FONT_VALUE
    export COL1_BG_FROM_CONFIG COL1_FONT_FROM_CONFIG COL2_BG_FROM_CONFIG COL2_FONT_FROM_CONFIG
}

# Display color scheme
display_color_scheme() {
    echo ""

    if [ "$COL1_BG_FROM_CONFIG" = true ]; then
        echo "Column 1 background = $COL1_BG_VALUE ($(get_color_name $COL1_BG_VALUE))"
    else
        echo "Column 1 background = default ($(get_color_name $COL1_BG_VALUE))"
    fi

    if [ "$COL1_FONT_FROM_CONFIG" = true ]; then
        echo "Column 1 font color = $COL1_FONT_VALUE ($(get_color_name $COL1_FONT_VALUE))"
    else
        echo "Column 1 font color = default ($(get_color_name $COL1_FONT_VALUE))"
    fi

    if [ "$COL2_BG_FROM_CONFIG" = true ]; then
        echo "Column 2 background = $COL2_BG_VALUE ($(get_color_name $COL2_BG_VALUE))"
    else
        echo "Column 2 background = default ($(get_color_name $COL2_BG_VALUE))"
    fi

    if [ "$COL2_FONT_FROM_CONFIG" = true ]; then
        echo "Column 2 font color = $COL2_FONT_VALUE ($(get_color_name $COL2_FONT_VALUE))"
    else
        echo "Column 2 font color = default ($(get_color_name $COL2_FONT_VALUE))"
    fi
}

# Initialize everything
init_colors() {
    read_config
}

# Export functions
export -f get_color_name read_config display_color_scheme init_colors
