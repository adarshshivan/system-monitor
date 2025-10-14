#!/usr/bin/env bash
# Linux System Resource Monitor
# Author: Adarsh Shivan
# Date: $(date)
# Description: Displays system resource usage details (CPU, memory, disk, uptime, and network).

echo "====================================="
echo "  🖥️  LINUX SYSTEM RESOURCE MONITOR"
echo "====================================="

# 1️⃣ Uptime and Load Average
echo -e "\n📆 System Uptime and Load:"
uptime

# 2️⃣ CPU Usage
echo -e "\n⚙️ CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " 100 - $8 "%"}'

# 3️⃣ Memory Usage
echo -e "\n💾 Memory Usage:"
free -h | awk 'NR==2{printf "Used: %s / Total: %s (%.2f%%)\n", $3, $2, $3*100/$2 }'

# 4️⃣ Disk Usage
echo -e "\n🧱 Disk Usage:"
df -h | grep -E '^/dev/' | awk '{ print $1": "$5" used ("$3" of "$2")"}'

# 5️⃣ Network Info
echo -e "\n🌐 Network Information:"
ip -br addr show | awk '{print $1": "$3}'

# 6️⃣ Top 5 Memory-consuming processes
echo -e "\n🔥 Top 5 Memory-Consuming Processes:"
ps -eo pid,comm,%mem,%cpu --sort=-%mem | head -n 6

echo -e "\n✅ Report generated on: $(date)"

