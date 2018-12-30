Run nexus3 in docker container.

Image documentation: https://hub.docker.com/r/sonatype/nexus3

Usage
```
---
# ...
  roles:
  - role: uni.dockered-nexus
    dockered_nexus:
      version: "..." # nexus3 version, optional, must be in quotes. defaults to "3.14.0"
      network_mode: "..." # docker network mode, optional. defaults to host
# ...
```

Demo
```
# ...
  roles:
  - role: uni.dockered-nexus
    dockered_nexus:
      version: "3.12.1"
      network_mode: host
# ...
```
