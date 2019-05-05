Run duplicati in docker container.

Docker hub: https://hub.docker.com/r/linuxserver/duplicati

Usage
```
---
# ...
  roles:
  - role: dockered/duplicati-run
    dockered_duplicati_env: {uid: "1000", gid: "1000", tz: Europe/London} # optional. defaults to {}
    dockered_duplicati_container_name: duplicati # optional. defaults to "{{xfacts.system.ansible_managed_prefix}}-duplicati"
    dockered_duplicati_version: latest # optional. defaults to amd64-v2.0.4.5-2.0.4.5_beta_2018-11-28-ls15
    dockered_duplicati_restart_policy: unless-stopped # optional. defaults to always
    dockered_duplicati_network_mode: bridge # optional. defaults to host
    dockered_duplicati_ports: # optional. defaults to []
    - "8200:8200"
    dockered_duplicati_volumes: # optional. defaults to []
    - "{{ xfacts.user.homedir }}/source:/source"
    - "{{ xfacts.user.homedir }}/backups:/backups"
    - "{{ xfacts.user.homedir }}/config:/.config"
# ...
```
