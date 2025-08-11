# PiRouter
# Raspberry Pi 5 WiFi Router with Network Monitoring

This project turns a Raspberry Pi 5 (8GB RAM) into a WiFi access point router with detailed network monitoring using `vnstat`, `Telegraf`, `InfluxDB`, and `Grafana`.  

You’ll get per-interface bandwidth stats, client signal strength, protocol summaries, and more — all visualized in Grafana dashboards.  

---------------------------------------------------------------------

## Features
- WiFi Access Point with NAT routing  
- DHCP and DNS via `dnsmasq`  
- Traffic monitoring and bandwidth stats with `vnstat`  
- Packet capture summaries via `tcpdump`  
- Custom scripts logging WiFi client info and top bandwidth users  
- Metrics collected with `Telegraf` and stored in `InfluxDB 1.x`  
- Real-time visualization in Grafana
  
---------------------------------------------------------------------

# I've chosen a minimalist setup with Telegraf and InfluxDB. That said, this project uses InfluxDb version 1.x. If you attempt to declare inputs or ouputs designed for 2.x you will have a tough time debugging. Anyway, I will continue building this project with the further configuration, ping, download speed, intrusion attempts, etc... 

# The ultimate goal for this project is using a FPGA to accelerate some hardware. 
