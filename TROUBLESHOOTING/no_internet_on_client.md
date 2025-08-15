## Step 1: Check IP Forwarding

`sudo sysctl net.ipv4.ip_forward`

  ### Excpected output:
  
  > 1

### If not enabled add to /etc/sysctl.conf

  > net.ipv4.ip_forward=1

---

## Step 2: Verify with iptables (NAT)

```bash
sudo iptables -t nat -L -n -v
```

  ### Check for MASQUERADE rule on upstream

---

## Step 3: Check DHCP Server Status

`sudo systemctl status dnsmasq`

  ### Review DHCP leases:

  `cat /var/lib/misc/dnsmasq.leases`
  
---

## Step 4: Test connectivity from Client

```
ping 192.168.4.1  # AP IP
ping 8.8.8.8      # Public IP
```


  


