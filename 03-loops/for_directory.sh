#!/bin/bash
# Description: analyze directory content
# Use: ./for_directory.sh <directory>

# Validation
if [ $# -ne 1 ]
then
	echo "Error: Please provide a directory"
	echo "Use: $0 <directory>"
	exit 1
fi

directory=$1

# Check that it is a directory
if [ ! -d "$directory" ]
then
	echo "Error: '$directory' this is not a valid directory"
	exit 1
fi

# Initialize counters
total_dirs=0
total_files=0
total_links=0
total_hidden=0

echo "Analysing: $directory"
echo "============================="

# Skip to content
for item in "$directory"/{*,.*}
do
	# To ignore  you...
	[ "$(basename "$item")" = "." ] && continue
	[ "$(basename "$item")" = ".." ] && continue

	# Check existence (to handle empty globbing)
	[ ! -e "$item" ] && continue

	# Count on type
	if [ -L "$item" ]
	then
		total_links=$((total_links + 1))
	elif [ -d "$item" ]
	then
		total_dirs=$((total_dirs + 1))
	elif [ -f "$item" ]
	then
		total_files=$((total_files + 1))
	fi

	#  Hidden counters
	if [[ "$(basename "$item")" == .* ]]
	then
		total_hidden=$((total_hidden + 1))
	fi
done

# Results
echo "Directories:    $total_dirs"
echo "Regular files:  $total_files"
echo "Symbolic links: $total_links"
echo "Hidden files:   $total_hidden"
echo "----------------------------"
echo "TOTAL:          $((total_dirs + total_files + total_links))"
