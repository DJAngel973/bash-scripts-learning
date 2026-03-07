#!/bin/bash
# Description: Parse structured data with cut/awk
# Usage: ./parse_data.sh <file> <fiel_number>

REEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Display usage
usage() {
    echo "Usage: $0 <file> <field_number>"
    echo ""
    echo "Examples:"
    echo "  $0 /etc/passwd 1        # Extract usernames"
    echo "  $0 /etc/passwd 7        # Extract shells"
    echo "  $0 data.csv 2           # Extract column 2 from CSV"
}

# Validate arguments
if [ $# -ne 2 ]
then
    echo -e "${RED}[!] Error: Invalid arguments${NC}"
    usage
    exit 1
fi

file=$1
field=$2

# Validate file exists
if [ ! -f "$file" ]
then
    echo -e "${RED}[!] Error: File '$file' does not exist${NC}"
    exit 1
fi

# Validate field is a number
if ! [[ "$field" =~ ^[0-9]+$ ]]
then
    echo -e "${RED}[!] Error: Field must be a number${NC}"
    exit 1
fi

echo -e "${BLUE}[+] Parsing file: $file${NC}"
echo -e "${BLUE}[+] Extracting field: $field${NC}"
echo "================================"

# Method 1: Using cut (assumes ':' delimiter, common in /etc/passwd)
echo -e "${GREEN}Method 1: Using cut (delimiter ':')${NC}"
cut -d':' -f"$field" "$file" | head -10
echo "... (showing first 10 lines)"
echo ""

# Method 2: Using awk
echo -e "${GREEN}Method 2: Using awk (delimiter ':')${NC}"
awk -F: "{print \$$field}" "$file" | head -10
echo "... (showing first 10 lines)"
echo ""

# Example 3: Parse with statistics
total_lines=$(wc -l < "$file")
unique_values=$(cut -d':' -f"$field" "$file" | sort -u | wc -l)

echo -e "${YELLOW}Statistics:${NC}"
echo "  Total lines: $total_lines"
echo "  Unique values in field $field: $unique_values"
echo ""

# Example 4: Advanced parsing (show specific patterns)
echo -e "${YELLOW}Advanced: Lines containing 'root' or 'bash'${NC}"
awk -F: "/root|bash/ {print \$$field}" "$file" | head -5
echo "... (showing first 5 matches)"
