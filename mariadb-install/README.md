Install mariadb

Usage
```
---
# ...
  roles:
  - role: mariadb-install
    mariadb_version: "10.2" # optional. defaults to "10.3"
    mariadb_install_client: false # optional. defaults to true
    mariadb_install_server: false # optional. defaults to true
# ...
```
