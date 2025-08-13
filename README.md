# PiRouter
## Raspberry Pi 5 WiFi Router with Network Monitoring
---
<img width="3440" height="1440" alt="image" src="https://github.com/user-attachments/assets/69aa4e88-73e9-4a99-b40d-198bf261c062" />

This project turns a Raspberry Pi 5 (8GB RAM) into a WiFi access point router with detailed network monitoring using `vnstat`, `Telegraf`, `InfluxDB`, and `Grafana`.  

You’ll get per-interface bandwidth stats, client signal strength, protocol summaries, and more — all visualized in Grafana dashboards.  

---

<img width="3440" height="1285" alt="image" src="https://github.com/user-attachments/assets/539c55ea-7f25-4377-b838-6e1482cd7a18" />



## Features
- WiFi Access Point with NAT routing  
- DHCP and DNS via `dnsmasq`  
- Traffic monitoring and bandwidth stats with `vnstat`  
- Packet capture summaries via `tcpdump`  
- Custom scripts logging WiFi client info and top bandwidth users  
- Metrics collected with `Telegraf` and stored in `InfluxDB 1.x`  
- Real-time visualization in Grafana


<img width="3440" height="1440" alt="Average Ping, download, and upload" src="https://github.com/user-attachments/assets/8888f490-3b21-4141-9374-3a0d425252d8" />

---

## A little about the project
I've chosen a minimalist setup with Telegraf and InfluxDB. That said, this project uses InfluxDb version 1.x. If you attempt to declare inputs or ouputs designed for 2.x you will have a tough time debugging. Anyway, I will continue building this project with the further configuration, ping, download speed, intrusion attempts, etc... 

The ultimate goal for this project is using a FPGA to accelerate some hardware. 
