Install docker

Usage
```
---
# ...
  roles:
  - role: docker-install
    docker_group_users: # optional. defaults to []
    - "{{ xfacts.user.name }}"
    docker_defaults: # optional. defaults to []
    - DOCKER_OPTS="--dns 8.8.8.8 --dns 8.8.4.4"
# ...
```
