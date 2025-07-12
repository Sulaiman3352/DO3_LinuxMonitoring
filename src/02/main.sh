#!/usr/bin/bash
export PATH=$(dirname $0):$PATH
. var.sh

echo -e "\nHostname=  $hostname \nTime Zone= $time \nUser=  $user \nOS  =  $os \nDate  =  $date \nUptime  =  $uptime \nIn Seconds= $upsec\n"
echo -e "Network: \nIPv4   =$ip \nMask   =$mask \nGateway=$gateway\n"
echo -e "Memory: \nTotal = $ram_total GB \nUsed  = $ram_used GB\nFree  = $ram_free GB\n"
echo -e "Disk (Root)= \nTotal Space= $space_root_gb MB \nUsed Space = $space_root_used_gb MB \nFree Space = $space_root_free_gb MB"

echo "Do you want to save this report in a file? y/n"
read answer

if [ "$answer" == 'y' ] || [ "$answer" == 'Y' ]; then
    { echo -e "\nHostname=  $hostname \nTime Zone= $time \nUser=  $user \nOS  =  $os \nDate  =  $date \nUptime  =  $uptime \nIn Seconds= $upsec\n"; echo -e "Network= \nIPv4   =$ip \nMask   =$mask \nGateway=$gateway\n"; echo -e "Memory= \nTotal = $ram_total GB \nUsed  = $ram_used GB\nFree  = $ram_free GB\n"; echo -e "Disk (Root)= \nTotal Space= $space_root_gb MB \nUsed Space = $space_root_used_gb MB \nFree Space = $space_root_free_gb MB"; } > $dayn\_$day\_$month\_$year\_$hour\_$minute\_$second.txt
else
    echo "The report did not save."    
fi
