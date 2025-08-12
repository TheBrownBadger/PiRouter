#!/bin/bash
# wifi_clients.sh - WiFi station list for InfluxDB
# Requires: iw

HOST=$(hostname)
IFACE="wlan0"

sudo iw dev "$IFACE" station dump | \
awk -v host="$HOST" '
/Station/ {MAC=$2}
/signal:/ {SIG=$2; printf "wifi_clients,host=%s,mac=%s signal_dbm=%s\n", host, MAC, SIG}'

# Make it executable
chmod +x /home/pi/scripts/wifi_clients.sh

