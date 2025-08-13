## Point hostapd to your configuration

### Edit /etc/default/hostapd and add

> DAEMON_CONF="/etc/hostapd/hostapd.conf"

---

### Next, start hostapd

```
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo systemctl start hostapd
