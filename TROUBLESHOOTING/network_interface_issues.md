# Issue: Interface name changes on reboot:

## Step 1: Check current interfaces:

`ip link show `

  ### Fix persisten naming with udev rules or by locking interface names om `/etc/dhcpcd.conf`

# Issue: Interface IP Address changes unexpectedly:

## Step 1: Verify static IP is set in `/etc/dhcpcd.conf`

```java
interface wlan0
  static ip_address=192.168.4.1/24
  nohook wpa_supplicant
```

---

## Step 2: Restart `dhcpcd`

`sudo systemctl restart dhcpcd`
