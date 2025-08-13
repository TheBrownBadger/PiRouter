## Step 1: Check Telegraf service:

`sudo systemctl status telegraf`

  - ### Restart if stopped:
  
    `sudo systemctl restart telegraf`

---

## Step 2: Review Telegraf log for plugin errors:

`sudo journalctl -u telegraf -n 50`

---

## Step 3: Verify InfluxDB is running:

`sudo systemctl status influxdb`

-  ### Check InfluxDB logs for errors

---

## Step 4: Ensure custom scripts are executable

`sudo chmod +x /home/pi/scripts/*.sh`

---

## Step 5: Run scripts manually to check output and errors:

```bash
sudo sh /home/pi/scripts/vnstat_summary.sh
sudo sh /home/pi/scripts/tcpdump_summary.sh
sudo sh /home/pi/scripts/wifi_clients.sh
sudo sh /home/pi/scripts/top_bandwidth_users.sh
```

---

## Step 6: Check Telegraf configuration:

  ### * Confirm paths and plugin definitions in `/etc/telegraf/telegraf.conf`

  ### * Validate `[[inputs.exec]]` plugins have correct commands and `data_format`
  
