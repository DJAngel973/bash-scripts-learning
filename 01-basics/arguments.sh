
#!/bin/bash

############################################
# Sohow how to handle arguments
# Use: ./arguments.sh arg1 arg2 arg3 arg4
############################################

set -euo pipefail

# We validate that arguments were passed

if [ $# -eq 0 ]
then
	echo "Error: No arguments passed"
	echo "Use: $0 <arg1> <arg2> [arg3] [arg4]"
	exit 1
fi

echo "Script name: $0"
echo "Argument value 1: ${1: Not provided}"
echo "Argument value 2: ${2: Not provided}"
echo "Argument value 4: ${4: Not provided}"
echo "All the arguments: $0"
echo "Total arguments: $#"
