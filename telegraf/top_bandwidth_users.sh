#!/bin/bash
# top_bandwidth_users.sh - Top talkers for InfluxDB
# Requires: iftop

HOST=$(hostname)
IFACE="wlan0" # AP interface

sudo iftop -t -s 10 -i "$IFACE" 2>/dev/null \
| grep -E "=>" \
| awk '{print $2,$3}' \
| head -n 5 \
| while read IP BYTES; do
    CLEAN_IP=$(echo $IP | tr -d '[:space:]')
    CLEAN_BYTES=$(echo $BYTES | tr -d '[:alpha:]')
    echo "top_users,host=$HOST,ip=$CLEAN_IP bytes=$CLEAN_BYTES"
done

# Make it executable
`chmod +x /home/pi/scripts/top_bandiwdth_users.sh`
