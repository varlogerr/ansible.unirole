Install mariadb

Usage
```
---
# ...
  roles:
  - role: mariadb-install
    mariadb_version: "10.2" # optional. defaults to "10.3"
    mariadb_install_client: true # optional. defaults to false
    mariadb_install_server: true # optional. defaults to false
# ...
```
