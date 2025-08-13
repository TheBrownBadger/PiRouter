## Drop invalid packets

`sudo iptables -A INPUT -m conntrack --ctstate INVALID -j DROP`

## Allow established connections

`sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT`

## Block ping flood

`sudo iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j ACCEPT`
`sudo iptables -A INPUT -p icmp --icmp-type echo-request -j DROP`

## Prevent IP spoofing

```bash
for iface in wlan0 wlan1; do
    sudo iptables -A INPUT -i $iface -s 127.0.0.0/8 -j DROP
done
```

## Allow DNS & DHCP from clients

`sudo iptables -A INPUT -i wlan0 -p udp --dport 53 -j ACCEPT`
`sudo iptables -A INPUT -i wlan0 -p udp --dport 67 -j ACCEPT`

# Allow SSH only from specific IP (replace 192.168.50.10 with your admin PC)

`sudo iptables -A INPUT -i wlan0 -p tcp --dport 22 -s 192.168.50.10 -j ACCEPT`
`sudo iptables -A INPUT -i wlan0 -p tcp --dport 22 -j DROP`
