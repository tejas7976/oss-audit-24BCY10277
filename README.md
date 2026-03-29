# The Open Source Audit — Firefox (Ubuntu)
**Repository:** oss-audit-24BCY10277  
**Student:** TEJASVA MIDHA  
**Registration Number:** 24BCY10277  
**Course:** Open Source Software (OSS NGMC)  
**Chosen Open-Source Software:** Mozilla Firefox (Web Browser)

---

## Overview
This repository contains the **five required shell scripts** for the “Open Source Audit” capstone project.  
All scripts are written for a **real Ubuntu Linux system** and include comments for clarity.

---

## Requirements
- Ubuntu Linux (recommended: 20.04/22.04/24.04)
- `bash` shell
- Standard Linux utilities (usually preinstalled): `uname`, `whoami`, `uptime`, `date`, `du`, `ls`, `awk`, `grep`, `tail`, `wc`
- Optional (but common on Ubuntu): `lsb_release`
- If Firefox is installed via Snap (common on Ubuntu), the `snap` command should be available.

---

## Setup (One-time)
1. Clone the repository:
   ```bash
   git clone https://github.com/tejas7976/oss-audit-24BCY10277.git
   cd oss-audit-24BCY10277
   ```

2. Make scripts executable:
   ```bash
   chmod +x *.sh
   ```

---

## Scripts Included

### 1) System Identity Report — `script1_system_identity.sh`
**Purpose:** Prints a “welcome screen” style system identity report:
- Linux distribution name and kernel version  
- Current logged-in user and home directory  
- System uptime and current date/time  
- A message about the OS license (Linux kernel: GPL v2)

**Run:**
```bash
./script1_system_identity.sh
```

---

### 2) FOSS Package Inspector — `script2_package_inspector.sh`
**Purpose:** Checks if a package/app is installed and prints version/summary details.  
For Ubuntu, it checks:
- APT install (`dpkg`)  
- Snap install (especially for Firefox, which is commonly Snap on Ubuntu)

It also uses a **case statement** to print a one-line philosophy note.

**Run (Firefox):**
```bash
./script2_package_inspector.sh firefox
```
**Run (example: git):**
```bash
./script2_package_inspector.sh git
```

---

### 3) Disk and Permission Auditor — `script3_disk_perm_auditor.sh`
**Purpose:** Audits key system directories using a **for loop**, reporting:
- Directory size
- Permissions + owner + group

It also checks Firefox user config/profile directories (e.g., `~/.mozilla/firefox`).

**Run:**
```bash
./script3_disk_perm_auditor.sh
```

---

### 4) Log File Analyzer — `script4_log_analyzer.sh`
**Purpose:** Reads a log file line-by-line using a **while-read loop**, counts occurrences of a keyword (default: `error`), and prints:
- Total matches
- The last 5 matching lines (`grep` + `tail`)

It also includes a **do-while style retry** if the log file is empty.

**Run (Ubuntu syslog, default keyword = "error"):**
```bash
./script4_log_analyzer.sh /var/log/syslog
```
**Run (custom keyword):**
```bash
./script4_log_analyzer.sh /var/log/auth.log warning
```

---

### 5) Open Source Manifesto Generator — `script5_manifesto_generator.sh`
**Purpose:** An interactive script that:
- Asks the user 3 questions
- Composes a short open-source manifesto paragraph using the answers
- Saves it to a timestamped `.txt` file and prints it

**Run:**
```bash
./script5_manifesto_generator.sh
```

Output file example:
- `manifesto_<username>_YYYY-MM-DD.txt`

---

## Notes for Report (Firefox on Ubuntu)
Firefox on Ubuntu may be installed either via:
- **Snap** (most common on current Ubuntu versions), or
- **APT** (less common)

Helpful commands to identify installation:
```bash
snap list | grep -i firefox
dpkg -l | grep -i firefox
firefox --version
```

Common Firefox profile/config locations to document:
- `~/.mozilla/firefox/`
- (Snap installs may also use) `~/snap/firefox/common/.mozilla/firefox/`

---

## License
These scripts are provided for an academic open-source course project.