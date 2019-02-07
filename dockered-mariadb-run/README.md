Run mariadb in docker container.

Image documentation: https://hub.docker.com/_/mariadb

Usage
```
# ...
  roles:
  - role: dockered-mariadb-run
    dockered_mariadb_container_name: mariadb # optional. defaults to "{{xfacts.system.ansible_managed_prefix}}-mariadb"
    dockered_mariadb_version: "10.2" # optional. defaults to 10.3.12
    dockered_mariadb_restart_policy: unless-stopped # optional. defaults to always
    dockered_mariadb_network_mode: bridge # optional. defaults to host
    dockered_mariadb_ports: # optional. defaults to []
    - "3306:3306"
    dockered_mariadb_root_pass: abc # optional. defaults to qwerty
    dockered_mariadb_user: user1 # optional. defaults to None
    dockered_mariadb_pass: pass1 # optional. defaults to None
    dockered_mariadb_db: mydb # optional. default no None
# ...
```
