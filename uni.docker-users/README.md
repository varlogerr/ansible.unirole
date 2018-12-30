Add users to docker group

Usage
```
---
# ...
  roles:
  - role: uni.docker-users
    docker_users: # optional. defaults to []
    - "{{ ansible_user_id }}"
# ...
```

Dependencies:
- uni.docker
