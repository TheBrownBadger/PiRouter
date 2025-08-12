#!/bin/bash
# vnstat_summary.sh - Bandwidth usage per interface in InfluxDB line protocol
# Requires: vnstat, jq

HOST=$(hostname)

vnstat --json | jq -c '.interfaces[]' | while read iface; do
    NAME=$(echo "$iface" | jq -r '.name')
    RX=$(echo "$iface" | jq -r '.traffic.day[-1].rx') # bytes received today
    TX=$(echo "$iface" | jq -r '.traffic.day[-1].tx') # bytes sent today

    echo "vnstat_usage,host=$HOST,interface=$NAME rx_bytes=$RX,tx_bytes=$TX"
done

# Make it executable
chmod +x /home/pi/scripts/vnstat_summary.sh
