# Installation

## Prerequisites
- Raspberry Pi with Raspberry Pi OS (64-bit)
- Internet connection for initial setup
- WiFi adapter that supports AP mode
  * I've chosen the Archer T3U AC1300 from tp-link. It works out of the box
- Working knowledge of the command line
  * InfluxDB 1.x does not have a UI but 2.x does
 
## Step 1: Update the System

```bash
sudo apt update && sudo apt upgrade -y
```


## Step 2: Install Required Packages
  - dnsmasq: DHCP and DNS server
  - hostapd: Access point daemon
  - vnstat: Network traffic monitor
  - influxdb: Time-series database
  - grafana: Visualization dashboard
  - tcpdump: Network packet analyzer
  - iftop: Network bandwidth monitor
  - iw: Wireless tools
  - jq: JSON processor for scripts
  - fail2ban: Brute-force blocking
  - arpwatch: Rogue device detection

    
```bash
sudo apt install dnsmasq hostapd vnstat telegraf influxdb grafana tcpdump iftop iw jq fail2ban arpwatch -y
```
  
  * Note: You may have to download InfluxDB and Grafana from their respective sites
  * For InfluxDB visit <https://www.influxdata.com> and follow the steps. 
  * For Grafana, visit <https://grafana.com> and create a free account. For this project I've chosen Grafana Cloud.

## Step 3: Enable and Configure Services
  
  - # Configure: (See dedicated file)
    - dnsmasq
    - hostapd
    - dhcpd

  - # Enable:
    - vnstat
    - telegraf
    - influxdb
    - grafana-server

    ```bash
    sudo systemctl enable -now vnstat telegraf influxdb grafana-server
    ````
  
    - Check service status
   
      ```bash
      sudo systemctl status vnstat telegraf influxdb grafana-server
      ```

      
## Step 4: Prepare Custom Monitoring Scripts
  
  - We make custom monitoring scripts and store them in /home/pi/scripts/

    ```bash
    sudo mkdir /home/pi/scripts/
    ```
  - Make it executable
  
    ```bash
    sudo chmod +x /home/pi/scripts/*.sh
    ```
  - Ensure Telegraf ```exec``` input plugin is configured to run these scripts...more on that later

## Step 5: Configure Telegraf to Run Scripts
  - Your Telegraf configuration is found at ```/etc/telegraf/telegraf.conf``` and has many configurations, for now, put everything, including this script, at the bottom.

    ```toml
    [[inputs.exec]]
      commands = [
        "/home/pi/scripts/vnstat_summary.sh",
        "/home/pi/scripts/tcpdump_summary.sh",
        "/home/pi/scripts/wifi_clients.sh"
    ]

      timeout = "10s"
      data_format = "influx"
    ```
 
  -  Restart Telegraf after editing

    
      ```bash
      sudo systemctl restart telegraf
      ```


## Step 6: Import Grafana Dashboard

 - Access Grafana at ```http://<pi-ip>:3000``` your default credientials are: admin/admin
  - Import the provided JSON dashboard file for monitoring visuals
  
