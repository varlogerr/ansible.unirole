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
    hosts_file_current_to_localhost: true # convert current host ip to 127.0.0.1, optional. defaults to false
# ...
```
