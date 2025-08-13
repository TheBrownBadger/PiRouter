# Connection drops after connecting

## Step 1: Disable WiFi power saving on Pi

```bash
sudo iw dev wlan0 set power_save off
```

## Step 2: Restart services
```bash
sudo systemctl restart hostapd
sudo systemctl restart dnsmasq
