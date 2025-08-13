## Create udev rules so wlan0 is always your access point interface and wlan1 is always upstream

## Step 1: Lock interface names we need to find our MAC address

## Use 
`sudo ip link`

## Your output should look like..
---
> 2: wlan0: <BROADCAST,MULTICAST,UP,LOWER_UP> ...
     
      link/ether aa:bb:cc:dd:ee:ff brd ff:ff:ff:ff:ff:ff
      
> 3: wlan1: ...
     
       link/ether 11:22:33:44:55:66 brd ff:ff:ff:ff:ff:ff

---

## Your MAC address for your access point (wlan0) is
> aa:bb:cc:dd:ee:ff

---

## Your MAC address for your upstream (wlan1) is
> 11:22:33:44:55:66

---

## Step 2: Edit or create 
`
/etc/udev/rules.d/70-persistent-net.rules
`

## Step 3: and add

```
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="<MAC_of_AP>", NAME="wlan0"
SUBSYSTEM=="net", ACTION=="add", ATTR{address}=="<MAC_of_Upstream>", NAME="wlan1"
```

## Setp 4: Save iptables

`sudo sh -c "iptables-save > /etc/iptables/rules.v4"`

## Step 5: Ensure they're auto-loaded at boot

`sudo apt install iptables-persistent`

