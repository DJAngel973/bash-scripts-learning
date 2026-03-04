#!/bin/bash
# Description: Variables, arrays and data types

# Simple variables
name="Kali"
version=2025
active=true

echo "= Basic variables ="
echo "Name: $name"
echo "Version: $version"
echo "Active: $active"
echo

# Operations
num1=10
num2=5
sum=$((num1 = num2))
subtract=$((num1 - num2))
multiplication=$((num1 * num2))

echo "= Operations ="
echo "$num1 + $num2 = $sum"
echo "$num1 - $num2 = $subtract"
echo "$num1 * $num2 = $multiplication"
echo

# Arrays
tools=("nmap" "metasploit" "buerpsuite" "wireshark")

echo "= Arrays ="
echo "First tool: ${tools[0]}"
echo "All the tools: ${tools[@]}"
echo "Number of tools: ${#tools[@]}"
echo

# Special variables
echo "= Special variables ="
echo "PID of the script: $$"
echo "Last exit code: $?"
echo "Current directory: $PWD"
echo "Current user: $USER"
echo "Home: $HOME"
echo

# Command substitution
current_date=$(date +%Y-%m-%d)
system=$(uname -s)

echo "= Command substitution ="
echo "Date: $current_date"
echo "System: $system"
