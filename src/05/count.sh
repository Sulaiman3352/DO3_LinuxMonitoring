#!/bin/bash

conf_count=$(find "$path" -name "*.conf" -type f 2>/dev/null | wc -l)
txt_count=$(find "$path" -type f \( -name "*.txt" -o -name "*.text" \) 2>/dev/null | wc -l)
executable_count=$(find "$path" -type f -executable 2>/dev/null | wc -l)
log_count=$(find "$path" -name "*.log" -type f 2>/dev/null | wc -l)
archive_count=$(find "$path" -type f \( -name "*.tar" -o -name "*.tar.gz" -o -name "*.tgz" -o -name "*.zip" -o -name "*.rar" -o -name "*.7z" -o -name "*.bz2" -o -name "*.xz" -o -name "*.gz" \) 2>/dev/null | wc -l)
symlink_count=$(find "$path" -type l 2>/dev/null | wc -l)

# Calculate the sum
total_special_files=$((conf_count + txt_count + executable_count + log_count + archive_count + symlink_count))

export total_special_files
