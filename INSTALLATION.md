# Installation

## Prerequisites
- Raspberry Pi with Raspberry Pi OS (64-bit)
- Internet connection for initial setup
- WiFi adapter that supports AP mode
  * I've chosen the Archer T3U AC1300 from tp-link. It works out of the box
- Working knowledge of the command line
  * InfluxDB 1.x does not have a UI but 2.x does

---
  
## Step 1: Update the System

`sudo apt update && sudo apt upgrade -y`

---

## Step 2: Install Required Packages
  - dnsmasq: DHCP and DNS server
  - hostapd: Access point daemon
  - vnstat: Network traffic monitor
  - influxdb: Time-series database
  - grafana: Visualization dashboard
  - tcpdump: Network packet analyzer
  - net-tools: netstat and ifconfig provider
  - iftop: Network bandwidth monitor
  - iw: Wireless tools
  - jq: JSON processor for scripts
  - fail2ban: Brute-force blocking
  - arpwatch: Rogue device detection

    
`sudo apt install dnsmasq hostapd vnstat telegraf influxdb grafana tcpdump net-tools iftop iw jq fail2ban arpwatch -y`
  
  * Note: You may have to download InfluxDB and Grafana from their respective sites
  * For InfluxDB visit <https://www.influxdata.com> and follow the steps. 
  * For Grafana, visit <https://grafana.com> and create a free account. For this project I've chosen Grafana Cloud.

---

## Step 3: Enable and Configure Services
  
  - ### Configure: (See dedicated file)
    - dnsmasq
    - hostapd
    - dhcpd

  - ### Enable:
    - vnstat
    - telegraf
    - influxdb
    - grafana-server
    
`sudo systemctl enable -now vnstat telegraf influxdb grafana-server`

---

## Step 4: Check service status

`sudo systemctl status vnstat telegraf influxdb grafana-server`

---
      
## Step 5: Prepare Custom Monitoring Scripts

`sudo mkdir /home/pi/scripts/`

### Make it executable

`sudo chmod +x /home/pi/scripts/*.sh`

---

## Step 6: Configure Telegraf to Run Scripts

### Your Telegraf configuration is found at `/etc/telegraf/telegraf.conf` and has many configurations, for now, put everything, including this script, at the bottom.

    [[inputs.exec]]
      commands = [
        "/home/pi/scripts/vnstat_summary.sh",
        "/home/pi/scripts/tcpdump_summary.sh",
        "/home/pi/scripts/top_bandwidth_users.sh",
        "/home/pi/scripts/wifi_clients.sh"
    ]

      timeout = "10s"
      data_format = "influx"
      
---

## Step 7: Restart Telegraf after editing

`sudo systemctl restart telegraf`

---

## Step 8: Import Grafana Dashboard

 - Access Grafana at ```http://<pi-ip>:3000``` your default credientials are: admin/admin
 - Import the provided JSON dashboard file for monitoring visuals
  

## You're ready for visualization!




