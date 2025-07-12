#!/usr/bin/bash
export PATH=$(dirname $0):$PATH
. var.sh
eval "$COLORS_bg"
eval "$COLORS_t"

p1="$1"
p2="$2"
p3="$3"
p4="$4"

if [ "$p1" -eq "$p2" ] || [ "$p3" -eq "$p4" ]; then
    echo "Error: Background and font must differ in the same column"
    echo "Usage: $0 <bg_names> <font_names> <bg_values> <font_values>
    Run the script again with correct parameters"
    exit 1
fi

bg_color "$1" "$2" "$3" "$4" 
t_color "$1" "$2" "$3" "$4" 

echo -e "\n$(apply_name_style "Hostname$NC=") $(apply_value_style "$hostname") \n$(apply_name_style "Time Zone$NC=") $(apply_value_style "$time") \n$(apply_name_style "User$NC=")  $(apply_value_style "$user") \n$(apply_name_style "OS  $NC=")  $(apply_value_style "$os") \n$(apply_name_style "Date  $NC=")  $(apply_value_style "$date") \n$(apply_name_style "Uptime  $NC=")  $(apply_value_style "$uptime") \n$(apply_name_style "In Seconds$NC=") $(apply_value_style "$upsec")\n"
echo -e "Network: \n$(apply_name_style "IPv4   $NC=") $(apply_value_style "$ip") \n$(apply_name_style "Mask   $NC=")$(apply_value_style "$mask") \n$(apply_name_style "Gateway$NC=")$(apply_value_style "$gateway")\n"
echo -e "Memory: \n$(apply_name_style "Total $NC=") $(apply_value_style "$ram_total GB") \n$(apply_name_style "Used  $NC=") $(apply_value_style "$ram_used GB")\n$(apply_name_style "Free  $NC=") $(apply_value_style "$ram_free GB")\n"
echo -e "Disk (Root): \n$(apply_name_style "Total Space$NC=") $(apply_value_style "$space_root_gb MB") \n$(apply_name_style "Used Space $NC=") $(apply_value_style "$space_root_used_gb MB") \n$(apply_name_style "Free Space $NC=") $(apply_value_style "$space_root_free_gb MB")"



