# Access Point is not visible or Client cannot connect


## Step 1: Check hostapd status:

`sudo systemctl status hostapd`

---

## Step 2: Review hostapd logs for errors:

`journalctl -u hostapd -xeu`

---

## Step 3: Ensure regulatory domain is set correctly:

```bash
iw reg get
sudo iw reg set US   # or your country code
```

---

## Step 4: Verify Access Point is up and configured:

`ip addr show wlan0`

---

## Step 5: Check `hostapd.conf` for correct `wpa`, `wpa_passphrase`, `ssid`, and `interface`


