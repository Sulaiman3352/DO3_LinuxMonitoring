#!/usr/bin/bash
export PATH=$(dirname $0):$PATH
start=`date +%s`

path=$1
path=${path%/}
if [ -z "$path" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi
. var.sh

echo -e "Total number of folders (including all nested ones) = $total_folders\n"
echo -e "TOP 5 folders of maximum size arranged in descending order (path and size):\n$top_size_folders\n"
echo -e "Total number of files = $total_n_files"
echo -e "Number of:"
echo -e "Configuration files (with the .conf extension) = $conf_count"
echo -e "Text files = $txt_count"
echo -e "Executable files = $executable_count"
echo -e "Log files (with the extension .log) = $log_count"
echo -e "Archive files = $archive_count"
echo -e "Symbolic links = $symlink_count"
echo -e "\nTOP 10 files of maximum size arranged in descending order (path, size and type):\n$t10_files\n"
echo -e "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):\n$t10_exe"


end=`date +%s`
runtime=$((end-start))
echo "Script execution time (in seconds) = $runtime"
