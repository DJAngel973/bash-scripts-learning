#!/bin/bash
# Description: Import and use functions from library
# Usage: ./use_library.sh

# Import functions from library
source ./functions_lib.sh

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Example 1: Use arithmetic functions
echo -e "${GREEN}=== Example 1: Arithmetic Functions ===${NC}"
result1=$(sum 10 5)
echo "Sum of 10 + 5 = $result1"

result2=$(multiply 6 7)
echo "Multiply 6 * 7 = $result2"
echo ""

# Example 2: Use validation functions
echo -e "${GREEN}=== Example 2: Validation Functions ===${NC}"
check_user "root"
check_user "nonexistentuser123"
echo ""

check_directory "/etc"
check_directory "/nonexistent"
echo ""

# Example 3: Use colored messages
echo -e "${GREEN}=== Example 3: Colored Messages ===${NC}"
print_message success "Operation completed successfully"
print_message error "An error occurred"
print_message info "Processing data..."
echo ""

# Example 4: Interactive menu
echo -e "${GREEN}=== Example 4: Interactive Menu ===${NC}"
exit_option=0

while [ $exit_option -ne 5 ]
do
	show_menu
	echo -n "Enter an option [1-5]: "
	read option

	case $option in
		1)
			echo -e "${YELLOW}Listing /etc/passwd:${NC}"
			cat /etc/passwd | head -10
			echo "...(showing first 10 lines)"
			;;
		2)
			echo -e "${YELLOW}Listing /etc directory:${NC}"
			ls -lh /etc | head -10
			echo "... (showing first 10 entries)"
			;;
		3)
			echo -n "Enter directory path to check: "
			read dir_path
			check_directory "$dir_path"
			;;
		4)
			echo -n "Enter username to search: "
			read username
			check_user "$username"
			;;
		5)
			echo -e "${GREEN}Exiting...${NC}"
			exit_option=5
			;;
		*)
			print_message error "Invalid option. Enter a number between 1 and 5"
			;;
	esac

	if [ $exit_option -ne 5 ]
	then
		echo ""
		echo -n "Press Enter to continue..."
		read
		clear
	fi
done
