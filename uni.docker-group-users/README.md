Add users to docker group

Usage
```
---
# ...
  roles:
  - role: uni.docker-group-users
    docker_group_users: # optional. defaults to []
    - "{{ ansible_user_id }}"
# ...
```

Dependencies:
- uni.docker-install
