#!/usr/bin/bash
. colors.sh

init_colors

# 1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black

NC='\033[0m'  # No Color (reset)
export NC

if [ ! -f color.conf ]; then
    echo "Error: color.conf file not found"
fi

a=$COL1_BG_VALUE
s=$COL1_FONT_VALUE
d=$COL2_BG_VALUE
f=$COL2_FONT_VALUE

bg_color() {
    case $a in
        1) 
        bgn="47" ;; # White text/background
        2) 
        bgn="41" ;; # Red
        3) 
        bgn="42" ;; # Green
        4) 
        bgn="44" ;; # Blue
        5) 
        bgn="45" ;; # Purple
        6) 
        bgn="40" ;; # Black
    esac
    
    case $d in
        1) 
        bgv="47" ;; 
        2) 
        bgv="41" ;; 
        3) 
        bgv="42" ;; 
        4) 
        bgv="44" ;; 
        5) 
        bgv="45" ;; 
        6) 
        bgv="40" ;; 
    esac
}

t_color() {
    case $s in
        1) 
        tcn="37" ;; # White text/background
        2) 
        tcn="31" ;; # Red
        3) 
        tcn="32" ;; # Green
        4) 
        tcn="34" ;; # Blue
        5) 
        tcn="35" ;; # Purple
        6) 
        tcn="30" ;; # Black
    esac
    
    case $f in
        1) 
        tcv="37" ;;
        2) 
        tcv="31" ;; 
        3) 
        tcv="32" ;; 
        4) 
        tcv="34" ;; 
        5) 
        tcv="35" ;; 
        6) 
        tcv="30" ;; 
    esac
}

# Call functions to set colors
bg_color
t_color

apply_name_style() {
    echo -e "\e[${tcn};${bgn}m$1\e[0m"
}

apply_value_style() {
    echo -e "\e[${tcv};${bgv}m$1\e[0m"
}


hostname=$(hostnamectl hostname)
time=$(timedatectl status | awk '{print $3}' | sed -n '4p')
user=$(whoami)
os=$(cat /etc/issue)
date=$(date)
uptime=$(uptime -p)
upsec=$(awk '{print $1}' /proc/uptime)
ip=$(hostname -I)
mask=$(ifconfig | grep netmask | awk '{print $4}' | head -n 1)
gateway=$(nmcli device show wlan0 | grep "IP4.GATEWAY" | awk '{print $2}' | head -n 1)
ram_total=$(free -m | sed -n '2p' | awk '{printf "%.3f", $2 / 1024}')
ram_used=$(free -m | sed -n '2p' | awk '{printf "%.3f", $3 / 1024}')
ram_free=$(free -m | sed -n '2p' | awk '{printf "%.3f", $7 / 1024}')
space_root_gb=$(df -B1 --output=size / | tail -n1 | awk '{printf "%.2f", $1 / (1024^2)}')
space_root_used_gb=$(df -B1 --output=used / | tail -n1 | awk '{printf "%.2f", $1 / (1024^2)}')
space_root_free_gb=$(df -B1 --output=avail / | tail -n1 | awk '{printf "%.2f", $1 / (1024^2)}')

# Export functions after they're defined
export -f bg_color t_color apply_name_style apply_value_style
export a s d f
