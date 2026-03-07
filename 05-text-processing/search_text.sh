#!/bin/bash
# Description: Advanced file search
# Usage: ./search_text.sh <file> <text>

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Validation
if [ $# -ne 2 ]
then
	echo -e "${RED}[!] Error: Incorrect arguments${NC}"
	echo "Usage: $0 <file> <text_to_search_for>"
	exit 1
fi

file=$1
search=$2

# Verify file
if [ ! -f "$file" ]
then
	echo -e "${RED}[!] Error: '$file' does not exist${NC}"
	exit 1
if

echo -e "${YELLOW}[*] Searching '$search' in $file...${NC}"
echo ""

# Search with grep
if grep -q "$search" "$file"
then
	echo -e "${GREEN}[+] Text found${NC}"
	echo ""
	echo "Lines that contain '$search':"
	echo "------------------------------"
	grep -n --color=always "$search" "$file"
	echo ""
	echo "Total number of matches: $(grep -c "$search" "$file")"
else
	echo -e "${RED}[!] Text not found${NC}"
	exit 1
fi
