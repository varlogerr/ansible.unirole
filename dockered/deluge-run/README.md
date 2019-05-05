Demo usage
```
# ...
  roles:
  - role: dockered/deluge-run
    dockered_deluge_network_mode: bridge # optional. defaults to host
    dockered_deluge_publish_ports: # optional. defaults to []
    - 8112:8112
    dockered_deluge_container_name: deluge # optional. defaults to "{{xfacts.system.ansible_managed_prefix}}-deluge"
    dockered_deluge_restart_policy: unless-stopped # optional. defaults to "unless-stopped"
    dockered_deluge_uid: "1001" # optional. defaults to "1000"
    dockered_deluge_gid: "1001" # optional. defaults to "1000"
    dockered_deluge_dirs: # optional. defaults to []
    - "{{xfacts.user.homedir}}/.config/deluge:/app/.config"
    - "{{xfacts.user.homedir}}/.torrents:/app/.torrents"
    - "{{xfacts.user.homedir}}/Downloads:/app/Downloads"
    - "{{xfacts.user.homedir}}/Uploads:/app/Uploads" # will be created and mounted
    - ":/app/Mix" # will be created in the container only
# ...
```
