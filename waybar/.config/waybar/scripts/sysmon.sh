#!/bin/bash

export LC_ALL=C

cpu_val=$(vmstat 1 2 | tail -1 | awk '{print 100 - $15}')

mem_used=$(free -h | awk '/Mem:/ {print $3}')
mem_total=$(free -h | awk '/Mem:/ {print $2}')
mem_perc=$(free -m | awk '/Mem:/ {print int($3/$2 * 100)}')

disk_used=$(df -h / | awk 'NR==2 {print $3}')
disk_total=$(df -h / | awk 'NR==2 {print $2}')
disk_perc=$(df -h / | awk 'NR==2 {print $5}')

if [ -z "$cpu_val" ]; then cpu_val="0"; fi
if [ -z "$mem_perc" ]; then mem_perc="0"; fi

printf '{ "text": " %s%%", "tooltip": " CPU: %.0f%%\\n RAM: %s / %s (%s%%)\\n Disk: %s / %s (%s)", "class": "sysmon" }' "$mem_perc" "$cpu_val" "$mem_used" "$mem_total" "$mem_perc" "$disk_used" "$disk_total" "$disk_perc"
