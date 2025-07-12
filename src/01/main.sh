#!/usr/bin/bash

input="$1"

if [[ "$input" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input"
else
    echo "$input"
	
fi 
