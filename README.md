# Bash Scripting Essentials

> Essential Bash scripts for learning Linux fundamentals, system administration, and cybersecurity basics.
---

## About This Repository

This repository contains **10 essential Bash scripts** that cover fundamental to intermediate concepts used in:
- **System Administration**: Automating repetitive tasks
- **Cybersecurity**: Reconnaissance, log analysis, automation
- **DevOps**: Scripting for deployments and monitoring

All scripts are based on knowledge from **[Securiters Academy](https://securiters.com)**, a cybersecurity training program, and adapted for practical learning.

---

## Learning Source

These scripts are educational materials derived from:
- **Securiters Academy** - Cybersecurity course (Marta Barrio)
- Personal practice and improvements
- Real-world use cases in penetration testing and system administration

---

## Repository Structure

```
bash-scripts-learning/
├── README.md
├── LICENSE
├── .gitignore
│
├── 01-basics/
│   ├── arguments.sh        # Handle command-line arguments
│   ├── helloWorld.sh       # Variable and printing the variable data
│   ├── requestData.sh      # Identify the entered number if it is one
│   └── variables.sh        # Work with varibales, arrays, arithmetic 
│
├── 02-conditionals/
│   ├── file_checker.sh     # Validate files and permissions
│   └── menu.sh             # Interactive menus with case
│
├── 03-loops/
│   ├── for_directory.sh    # Analyze directories with for loops
│   └── while_counter.sh    # Counters and file reading with while
│
├── 04-functions/
│   ├── functions_lib.sh    # Reusable function library
│   └── use_library.sh      # Import and use functions (source)
│
├── 05-text-processing/
│   ├── search_text.sh      # Search text with grep
│   └── parse_data.sh       # Extract data with cut/awk
│
└── 06-automation/
    └── nmap_wrapper.sh     # Automate network scanning (pentesting)
```

---

## What You'll Learn

### Core Concepts Covered

| Script | Real-World Use | Key Takeaway |
|--------|----------------|--------------|
| **arguments.sh** | Accept user input in scripts | Essential for automation - every script needs input validation |
| **variables.sh** | Store and manipulate data | Foundation of all scripting - understand data types |
| **file_checker.sh** | Validate files before processing | Critical for security - always validate before acting |
| **menu.sh** | Create user-friendly tools | Professional scripts need interfaces |
| **for_directory.sh** | Process multiple files | Common in log analysis and backups |
| **while_counter.sh** | Read files line by line | Essential for log parsing and data processing |
| **functions_lib.sh** | Write reusable code | DRY principle - don't repeat yourself |
| **use_library.sh** | Organize large projects | Real projects have multiple files |
| **search_text.sh** | Find information in logs | Daily task in security and sysadmin |
| **parse_data.sh** | Extract specific data | Critical for report generation |
| **nmap_wrapper.sh** | Automate security tools | Real pentesting workflow automation |

---

## Why These Skills Matter

### In Cybersecurity

**Reconnaissance Phase:**
```bash
# You'll automate tasks like:
# - Scanning multiple targets
# - Parsing nmap results
# - Extracting open ports
# - Generating reports
```

**Log Analysis:**
```bash
# Real scenarios:
# - Searching for failed login attempts
# - Extracting IP addresses from logs
# - Counting attack patterns
# - Generating alerts
```

**Post-Exploitation:**
```bash
# Automate information gathering:
# - List running processes
# - Extract user accounts
# - Check network connections
# - Collect system information
```

### In System Administration

**Daily Tasks:**
```bash
# Automate repetitive work:
# - Backup scripts
# - User management
# - Disk space monitoring
# - Service health checks
```

---

## Script Details

### 01 - Basics

#### `arguments.sh` - Command-Line Arguments
**What it teaches:** How to make scripts accept input.

**Real-world example:**
```bash
# Instead of hardcoding values:
target="192.168.1.1"

# You can do:
./scan.sh 192.168.1.1
```

**Key concept:** `$1`, `$2`, `$@`, `$#` - These are how scripts become flexible.

---

#### `variables.sh` - Variables and Data Types
**What it teaches:** How to store and manipulate data.

**Real-world example:**
```bash
# Store scan results
results=$(nmap -p 80,443 target.com)

# Count findings
vulnerabilities=$((critical + high))
```

**Key concept:** Variables are the memory of your scripts.

---

### 02 - Conditionals

#### `file_checker.sh` - File Validation
**What it teaches:** How to validate before acting.

**Real-world example:**
```bash
# Before processing a file:
if [ ! -f "report.txt" ]; then
    echo "Error: Report not found"
    exit 1
fi
```

**Key concept:** Always validate input - prevents crashes and security issues.

---

#### `menu.sh` - Interactive Menus
**What it teaches:** How to create user-friendly tools.

**Real-world example:**
```bash
# Professional pentesting scripts have menus:
1) Quick scan
2) Full scan
3) Vulnerability assessment
4) Generate report
```

**Key concept:** Good scripts are easy to use - menus make tools professional.

---

### 03 - Loops

#### `for_directory.sh` - For Loops
**What it teaches:** How to process multiple items.

**Real-world example:**
```bash
# Scan multiple targets from a list:
for target in $(cat targets.txt); do
    nmap -sV $target >> results.txt
done
```

**Key concept:** Automation means doing the same task for many items.

---

#### `while_counter.sh` - While Loops
**What it teaches:** How to read files line by line.

**Real-world example:**
```bash
# Parse log file:
while read line; do
    if [[ $line == *"FAILED"* ]]; then
        echo $line >> failed_logins.txt
    fi
done < /var/log/auth.log
```

**Key concept:** Most data processing involves reading files line by line.

---

### 04 - Functions

#### `functions_lib.sh` + `use_library.sh`
**What it teaches:** How to organize code professionally.

**Real-world example:**
```bash
# Instead of repeating code:
# Script 1: validates IP
# Script 2: validates IP (same code)
# Script 3: validates IP (same code)

# Use a library:
source lib/validation.sh
validate_ip $target
```

**Key concept:** Professional projects use libraries - write once, use everywhere.

---

### 05 - Text Processing

#### `search_text.sh` - Text Search
**What it teaches:** How to find information in files.

**Real-world example:**
```bash
# Find all error messages:
grep "ERROR" /var/log/syslog

# Find failed SSH attempts:
grep "Failed password" /var/log/auth.log
```

**Key concept:** `grep` is the most-used command in security analysis.

---

#### `parse_data.sh` - Data Parsing
**What it teaches:** How to extract specific fields.

**Real-world example:**
```bash
# Extract usernames from /etc/passwd:
cut -d: -f1 /etc/passwd

# Extract IP addresses from logs:
awk '{print $1}' access.log | sort -u
```

**Key concept:** `cut` and `awk` turn messy data into useful information.

---

### 06 - Automation

#### `nmap_wrapper.sh` - Tool Automation
**What it teaches:** How to automate security tools.

**Real-world example:**
```bash
# Instead of typing commands manually:
sudo nmap -sS -p 1-65535 192.168.1.1
sudo nmap -A 192.168.1.1
sudo nmap -sn 192.168.1.0/24

# Use a menu script that does it for you
```

**Key concept:** Professionals automate repetitive tasks - scripts save time.

---

## Requirements

- **Bash 4.0+** (check: `bash --version`)
- **Linux/Unix system** (Ubuntu, Kali, Debian, Arch, etc.)
- Basic tools (usually pre-installed):
  - `grep`, `awk`, `cut`, `sed`
- Optional (for `nmap_wrapper.sh`):
  - `nmap` - Install with `sudo apt install nmap`

---

## Troubleshooting

### Script won't run: "Permission denied"
```bash
# Solution: Make it executable
chmod u+x script.sh
```

### Script not found: "Command not found"
```bash
# Solution: Use ./ to run from current directory
./script.sh
```

### Wrong interpreter: "Illegal option"
```bash
# Solution: Run with bash explicitly
bash script.sh
```

---

## Practice Exercises

After learning each script, try these challenges:

1. **Modify `arguments.sh`** to accept a `-h` help flag
2. **Extend `file_checker.sh`** to check file size
3. **Create a new menu option** in `menu.sh`
4. **Write a function** that checks if a port is open
5. **Automate** a log analysis task

---

## Additional Resources

### Learn More
- [Securiters Academy](https://securiters.com) - Cybersecurity courses
- [OverTheWire Bandit](https://overthewire.org/wargames/bandit/) - Practice Bash
- [Bash Guide](https://tldp.org/LDP/Bash-Beginners-Guide/html/) - Complete reference
- [ShellCheck](https://www.shellcheck.net/) - Validate your scripts
- [ExplainShell](https://explainshell.com/) - Understand commands

### Cybersecurity Context
- [OWASP Top 10](https://owasp.org/www-project-top-ten/) - Web security
- [GTFOBins](https://gtfobins.github.io/) - Unix binaries exploitation
- [HackTricks](https://book.hacktricks.xyz/) - Pentesting techniques

---

## ⚠️  Legal Disclaimer

**Important:** These scripts are for **educational purposes only**.

- ✅ Use on systems you own or have permission to test
- ✅ Practice in virtual machines (VirtualBox, VMware)
- ✅ Use for learning and skill development

- ❌ Do NOT use on systems without authorization
- ❌ Do NOT use for illegal activities
- ❌ Do NOT use to harm or disrupt systems

**Unauthorized access to computer systems is illegal** and may result in criminal prosecution.

---

## Acknowledgments

- **Securiters Academy** - Foundation and methodology
- **Marta Barrio** - Instructor and course creator
- **Open Source Community** - Tools and resources

---

<div align="center">

### ⭐ If this repository helps you learn, please give it a star! ⭐

**Happy Scripting! **

Made with for aspiring cybersecurity professionals

</div>
