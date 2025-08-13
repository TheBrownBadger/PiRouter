## Step 1: Check journal logs for each service:

```bash
journalctl -u vnstat -n 50
journalctl -u telegraf -n 50
journalctl -u influxdb -n 50
journalctl -u hostapd -n 50
journalctl -u dnsmasq -n 50
