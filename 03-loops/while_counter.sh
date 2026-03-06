#!/bin/bash
# Description: While loop and reading files
# Use: ./while_counter.sh [archivo]

# If the file is not provided, count to 100
if [ $# -eq 0 ]
then
	echo "Counter from 0 to 100"
	accountant=0
	max=100

	while [ $accountant -le $max ]
	do
		echo "$accountant"
		accountant=$((accountant + 1))
	done
	exit 0
fi

# If a file is provided, read line by line
file=$1

if [ ! -f "$file" ]
then
	echo "Error: '$file' does not exist or is not a file"
	exit 1
fi

echo "Reading file: $file"
echo "=============================="

line_num=1
while IFS= read -r line
do
	echo "Line $line_num: $line"
	line_num=$((line_num + 1))
done < "$file"

echo "=============================="
echo "Total lines: $((line_num - 1))"
