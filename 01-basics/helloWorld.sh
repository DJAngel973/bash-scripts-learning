################################################
# Script: helloWorld.sh
# Description: Basic script for introducing Bash
# Fountain: Securiters Academy
################################################

set - euo pipefail

# Print simple message
echo "Hello World"

# Example with variables
greeting="Hello"
target="World"
echo "$greeting $target"

# Example with colors
GREEN='\033[0;32m'
NC='\033[0m'  # No color
echo -e "${GREEN}Hello World in green!${NC}"
