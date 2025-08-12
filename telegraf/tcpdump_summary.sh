#!/bin/bash

# Interface to monitor
IFACE="wlan0"

# Capture tcpdump statistics for 1 second
# -n : no DNS lookup
# -c 0 : capture until Ctrl+C (but we use timeout to stop)
# -l : line-buffered output
# -i : interface
# Redirect stderr to stdout so we can parse
STATS=$(timeout 1 tcpdump -n -i "$IFACE" 2>&1 | grep -oP '\d+ packets captured|\d+ packets received by filter|\d+ packets dropped by kernel')

# Extract numbers from output
CAPTURED=$(echo "$STATS" | grep "captured" | grep -oP '^\d+')
RECEIVED=$(echo "$STATS" | grep "received" | grep -oP '^\d+')
DROPPED=$(echo "$STATS" | grep "dropped" | grep -oP '^\d+')

# Default to 0 if any are empty
CAPTURED=${CAPTURED:-0}
RECEIVED=${RECEIVED:-0}
DROPPED=${DROPPED:-0}

# Output in Influx line protocol
# Format: measurement,tag=value field=value
echo "tcpdump_summary,interface=$IFACE captured=${CAPTURED}i,received=${RECEIVED}i,dropped=${DROPPED}i"

# Make it executable
chmod +x /home/pi/scripts/tcpdump_summary.sh
