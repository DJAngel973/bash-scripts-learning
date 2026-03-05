#!/bin/bash
# Desciption: Complete file validation

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

if [ $# -ne 1 ]
then
	echo -e "${RED}[!] Error: You must provide a file or directory${NC}"
	echo "Usage: $0 <route>"
	exit 1
fi

route=$1

echo -e "${BLUE}[+] Analyzing: $route${NC}"
echo "======================================="

# Existence test
if [ -e "$route" ]
then
    echo -e "${GREEN} ${NC} Exists"
else
    echo -e "${RED} ${NC} Does not exist"
    exit 1
fi

# File type
if [ -f "$route" ]
then
	echo -e "${GREEN} ${NC} It is a regular file"
elif [ -d "$route" ]
then
	echo -e "${GREEN} ${NC} It is a direcotory"
elif [ -L "$route" ]
then
	echo -e "${GREEN} ${NC} It is a symbolic link"
fi

# Permits
echo
echo "Permits"
[ -r "$route" ] && echo -e "${GREEN} ${NC} Reading" || echo -e "${RED} ${NC} No reading"
[ -w "$route" ] && echo -e "${GREEN} ${NC} Writing" || echo -e "${RED} ${NC} No writing"
[ -x "$route" ] && echo -e "${GREEN} ${NC} Execution" || echo -e "${RED} ${NC} No execution"

# Additional information if it is a file
if [ -f "$route" ]
then
	echo
	echo "Additional information"
	echo " Size: $(du -h "$route" | cut -f1)"
	echo " Owner: $(stat -c '%U' "$route")"
	echo " Group: $(stat -c '%G' "$route")"
	echo " Permissions: $(stat -c '%A' "$route")"
fi
