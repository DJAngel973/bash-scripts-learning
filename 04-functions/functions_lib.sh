#!/bin/bash
# Description: Reusable function library
# Usage: source ./functions_lib.sh

# Function: Display a menu
show_menu(){
	echo "=============================="
	echo "          MAIN MENU"
	echo "=============================="
	echo "1) List /etc/passwd/"
	echo "2) List /etc directory"
	echo "3) Check if directory exists"
	echo "4) Search for user"
	echo "5) Exit"
	echo "=============================="
}

# Function: Sum two numbers
sum(){
	if [ $# -eq 2 ]
	then
		result=$(($1 + $2))
		echo "$result"
	else
		echo "Error: sum requires 2 arguments"
		return 1
	fi
}

# Function: Multiply two numbers
multiply(){
	if [ $# -eq 2 ]
	then
		result=$(($1 * $2))
		echo "$result"
	else
		echo "Error: multiply requires 2  arguments"
		return 1
	fi
}

# Function: Check if user exists
check_user(){
	if [ $# -eq 1 ]
	then
		username=$1
		if grep -q "^$username:" /etc/passwd
		then
			echo "User '$username' exists"
			return 0
		else
			echo "User '$username' does not exist"
			return 1
		fi
	else
		echo "Error: check_user requires 1 argument"
		return 1
	fi
}

# Function: Check if directory exists
check_directory(){
	if [ $# -eq 1 ]
	then
		dir=$1
		if [ -d "$dir" ]
		then
			echo "Directory '$dir' exists"
			return 0
		else
			echo "Directory '$dir' does not exist"
			return 1
		fi
	else
		echo "Error: check_directory requires 1 argument"
		return 1
	fi
}

# Function: Print colored message
print_message(){
	# Arguments: $1=type (successs/error/info), $2=message
	case $1 in
		success)
			echo -e "\033[0;32m[+] $2\033[0m"
			;;
		error)
			echo -e "\033[0;31m[!] $2\033[0m"
			;;
		info)
			echo -e "\033[0;34m[*] $2\033[0m"
			;;
		*)
			echo "$2"
			;;
	esac
}
