# Smart Network Intrusion Detection System (NIDS)

## Project Overview
This project implements a simple and effective Network Intrusion Detection System (NIDS) using Snort in Kali Linux. The system monitors live network traffic, detects suspicious activities such as ping attacks and TCP scans, generates alerts, and helps improve network security.

---

## Features
- Real-time network traffic monitoring
- Detects ICMP (Ping) attacks
- Detects TCP SYN/Port Scan attacks
- Custom Snort rules
- Lightweight and beginner friendly
- Works in Kali Linux
- Easy to extend with advanced features

---

## Technologies Used

| Tool | Purpose |
|------|---------|
| Kali Linux | Operating System |
| Snort 3 | Intrusion Detection System |
| Nmap | Attack Simulation |
| Bash | Automation |

---

## Project Architecture

text
Attacker System
       ↓
 Network Traffic
       ↓
   Snort IDS
       ↓
 Alert Detection
       ↓
 Security Logs
--- 
Installation Steps

1. Update System
sudo apt update && sudo apt upgrade -y
2. Install Snort
sudo apt install snort -y
3. Verify Installation
snort -V
Configuration
Edit Snort Rules
---
Open rules file:

sudo nano /etc/snort/rules/local.rules

Add the following rules:

alert icmp any any -> any any (
msg:"ICMP DETECTED";
sid:1000001;
rev:1;
)

alert tcp any any -> any any (
msg:"TCP DETECTED";
flags:S;
sid:1000002;
rev:1;
)

Save the file.

Running the IDS
Find Network Interface
ip a
---
Example interface:

eth0
wlan0
Start Snort
sudo snort -q -A alert_fast \
-c /etc/snort/snort.lua \
-R /etc/snort/rules/local.rules \
-i wlan0

Replace wlan0 with your interface name.
---
Stop Snort Scan

To stop the running Snort scan:

Press:

CTRL + C

Then type:

exit

Press ENTER.

Testing the IDS
ICMP Detection
---
Open another terminal and run:

ping 8.8.8.8
---
Expected alert:

ICMP DETECTED
TCP Detection
---
Run:

nmap scanme.nmap.org
---
Expected alert:

TCP DETECTED
---
Sample Output

[**] [1:1000001:1] ICMP DETECTED [**]

[**] [1:1000002:1] TCP DETECTED [**]
---
Project Structure

Smart_NIDS/
│

├── README.md

├── rules/

│   └── local.rules

│

├── logs/

│

└── scripts/
---
Advantages

Beginner-friendly cybersecurity project

Real-time monitoring

Simple setup

Easy rule customization

---
Future Enhancements

Email notifications

Telegram alerts

Dashboard visualization

AI-based anomaly detection

Automatic IP blocking

Suricata integration
