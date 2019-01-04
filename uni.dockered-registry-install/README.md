Run docker registry in docker container.

Docker hub: https://hub.docker.com/_/registry

Usage
```
---
# ...
  roles:
  - role: uni.dockered-registry-install
    dockered_registry_install:
      port: 5001 # published port, optional. defaults to 5000
      version: "2.6" # registry version, optional, must be in quotes. defaults to "2.7"
# ...
```
