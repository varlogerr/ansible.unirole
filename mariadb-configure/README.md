Configure mariadb

Usage
```
---
# ...
  roles:
  - role: mariadb-configure
    mariadb_root_password: qwerty # optional. no default value, password won't be set if not defined
    mariadb_no_anonymous_user: true # optional. defaults to false
    mariadb_users: # optional. defaults to []
    - name: test # required
      password: qwerty # required
      host: 69.69.69.69 # optional. defaults to '%'
      priv: 'wordpress.*:ALL' # optional. defaults to '*.*:ALL,GRANT'
      append_privs: yes # optional. defaults to no
# ...
```
