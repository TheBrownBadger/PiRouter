#!/bin/bash
# wifi_signal.sh - Output WiFi signal strength in InfluxDB line protocol

iface="wlan0"

signal=$(iwconfig $iface 2>/dev/null | grep -i --color=never "Signal level" | awk -F "=" '{print $3}' | awk '{print $1}')
quality=$(iwconfig $iface 2>/dev/null | grep -i --color=never "Link Quality" | awk -F "=" '{print $2}' | awk '{print $1}' | awk -F "/" '{print ($1*100)/$2}')

# Ensure both values exist
if [[ -n "$signal" && -n "$quality" ]]; then
    echo "wifi_signal,interface=${iface} signal_dbm=${signal}i,quality=${quality}i"
fi

# Make it executable
`chmod +x /home/pi/scripts/wifi_signal.sh`

