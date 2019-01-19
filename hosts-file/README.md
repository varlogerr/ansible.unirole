Configure /etc/hosts

Usage
```
---
# ...
  roles:
  - role: hosts-file
    hosts_file_host_to_ip_map: # optional. defaults to {}
      google.com: 0.0.0.0
      microsoft.com: 69.69.69.69
# ...
```
