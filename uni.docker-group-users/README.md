Add users to docker group

Usage
```
---
# ...
  roles:
  - role: uni.docker-group-users
    docker_group_users: # optional. defaults to []
    - "{{ helper_facts.user.name }}" # must be username, not uid
# ...
```

Dependencies:
- uni.docker-install
