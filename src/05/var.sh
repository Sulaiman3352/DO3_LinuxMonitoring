#!/usr/bin/bash
. count.sh

total_folders=$(find $path -type d | wc -l)
top_size_folders=$(du -Sh "$path" | sort -rh | head -5 | nl -w2 -s' - ')
## du command: Estimate file space usage.
##    -h : Print sizes in human-readable format (e.g., 10MB).
##    -S : Do not include the size of subdirectories.
##    -s : Display only a total for each argument.
##    sort command : sort lines of text files.
##    -r : Reverse the result of comparisons.
##    -h : Compare human readable numbers (e.g., 2K, 1G).
##    nl - number lines of files
##    head : Output the first part of the files.
total_n_files=$(find $path -type f -printf . | wc -c )
t10_files=$(find "$path" -type f -printf '%s %p\n' | sort -nr | head -10 | {
    counter=1
    while read size filepath; do
        # Get file extension for type
        extension="${filepath##*.}"
        # Convert to lowercase for consistency
        extension=$(echo "$extension" | tr '[:upper:]' '[:lower:]')
        # Format size to human readable
        formatted_size=$(echo "$size" | numfmt --to=iec-i --suffix=B)
        printf "%2d - %s, %s, %s\n" "$counter" "$filepath" "$formatted_size" "$extension"
        ((counter++))
    done
})

t10_exe=$(find "$path" -type f -executable -printf '%s %p\n' | sort -nr | head -10 | {
    counter=1
    while read size filepath; do
        # Calculate MD5 hash
        hash=$(md5sum "$filepath" 2>/dev/null | cut -d' ' -f1)
        # Format size to human readable
        formatted_size=$(echo "$size" | numfmt --to=iec-i --suffix=B)
        # Handle case where hash calculation might fail
        if [ -z "$hash" ]; then
            hash="[PERMISSION_DENIED]"
        fi
        # Output in required format
        printf "%2d - %s, %s, %s\n" "$counter" "$filepath" "$formatted_size" "$hash"
        ((counter++))
    done
})
