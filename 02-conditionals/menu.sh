#!/bin/bash
# Interactive menu with multiple options

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Global variables
log_dir="/var/log"

# Function to display the menu
show_menu() {
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}       MAIN MENU${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo ""
    echo "1) List the /etc/passwd file"
    echo "2) List the /etc directory"
    echo "3) Check for the existence of the /var/log directory"
    echo "4) Check for the existence of a user"
    echo "5) Exit"
    echo ""
    echo -n "Enter an option [1-5]: "
}

# Function to list password
list_passwd(){
	echo -e "${YELLOW}Contents of /etc/passwd:${NC}"
	cat /etc/passwd
}

# Function to list /etc
list_etc(){
	echo -e "${YELLOW}Contents of /etc:${NC}"
	ls -lh /etc | head -20
	echo "... (Showing first 20 lines)"
}

# Function to check directory
check_log_dir(){
	if [ -d "$log_dir" ]
	then
		echo -e "${GREEN} The directory $log_dir exists${NC}"
	else
		echo -e "${RED} The directory $log_dir does NOT exist${NC}"
	fi
}

# Function to verify user
check_user(){
	echo -n "Enter the user to search for:"
	read -r user

	if grep -q  "^$Suser:" /etc/passwd
	then
		echo -e "${GREEN} The user '$user' exists${NC}"
		echo "Information"
		grep "^$user:" /etc/passwd
	else
		echo -e "${RED} thE user '$user' NOT exist${NC}"
	fi
}

while true
do
    show_menu
    read -r option

    case $option in
        1)
            list_passwd
            ;;
        2)
            list_etc
            ;;
        3)
            check_log_dir
            ;;
        4)
            check_user
            ;;
        5)
            echo -e "${YELLOW}Exiting the script...${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}Invalid option${NC}"
            echo "Enter an option between 1 and 5"
            ;;
    esac

    echo
    echo -n "Press Enter to continue..."
    read -r
    clear
done
