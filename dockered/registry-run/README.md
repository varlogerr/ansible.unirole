Run docker registry in docker container.

Docker hub: https://hub.docker.com/_/registry

Usage
```
---
# ...
  roles:
  - role: dockered/registry-install
    dockered_registry_container_name: myregistry # optional. defaults to "{{xfacts.system.ansible_managed_prefix}}-registry"
    dockered_registry_version: "2.6" # optional. defaults to "2.7"
    dockered_registry_restart_policy: unless-stopped # optional. defaults to "always"
    dockered_registry_network_mode: bridge # optional. defaults to "host"
    dockered_registry_ports: # optional. defaults to []. can be used with bridge network mode
    - "8082:5000"
# ...
```
