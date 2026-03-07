#!/bin/bash
# Description: Interactive interface for Nmap
# Usage: sudo ./nmap.sh

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Verify root permissions
if [ "$EUID" -ne 0 ]
then
    echo -e "${RED}[!] This script requires root privileges${NC}"
    echo "Run: sudo $0"
    exit 1
fi

# Verify that nmap is installed
if ! command -v nmap &> /dev/null
then
    echo -e "${RED}[!] Nmap is not installed${NC}"
    echo "Install with: sudo apt install nmap"
    exit 1
fi

# Functions
Message(){
    case $1 in
        0)
            echo -e "${BLUE}[+] Enter an IP address or network (ej: 192.168.1.0/24):${NC}"
            ;;
        1)
            echo -e "${BLUE}[+] Enter a port or range (ej: 80 o 20-500):${NC}"
            ;;
        6)
            echo -e "${GREEN}[+] Exiting...${NC}"
            ;;
    esac
}

ReadIP(){
    read -r ip
    echo "$ip"
}

ReadPort(){
    read -r port
    echo "$port"
}

# Main Menu
output=0
while [ $output -ne 6 ]; do
    clear
    echo -e "${GREEN}==========  NMAP INTERACTIVE SCRIPT =========="
    echo ""
    echo "1) Basic scan (nmap <IP>)"
    echo "2) Host discovery (ARP)"
    echo "3) Ping sweep (sin ARP)"
    echo "4) Port scan (SYN Scan)"
    echo "5) Aggressive scan (nmap -A)"
    echo "6) Exit"
    echo ""
    echo -n "Select one option [1-6]: "
    read -r option

    case $option in
        1)
            Message 0
            ip=$(ReadIP)
            echo -e "${YELLOW}[*] Running: nmap $ip${NC}"
            nmap "$ip"
            ;;
        2)
            Message 0
            ip=$(ReadIP)
            echo -e "${YELLOW}[*] Running: nmap -sn -PR $ip${NC}"
            nmap -sn -PR "$ip"
            ;;
        3)
            Message 0
            ip=$(ReadIP)
            echo -e "${YELLOW}[*] Running: nmap -sn $ip --disable-arp-ping${NC}"
            nmap -sn "$ip" --disable-arp-ping
            ;;
        4)
            Message 0
            ip=$(ReadIP)
            Message 1
            port=$(ReadPort)
            echo -e "${YELLOW}[*] Running: nmap -p $puerto -sS $ip${NC}"
            nmap -p "$puerto" -sS "$ip"
            ;;
        5)
            Message 0
            ip=$(ReadIP)
            echo -e "${YELLOW}[*] Running: nmap -A $ip ${NC}"
            nmap -A "$ip"
            ;;
        6)
            Message 6
            output=6
            exit 0
            ;;
        *)
            echo -e "${RED}[!] Invalid option${NC}"
            ;;
    esac

    echo ""
    echo -n "Press enter to continue..."
    read -r
done
