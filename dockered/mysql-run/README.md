Run mysql/mariadb in docker container.

Images documentation:
* https://hub.docker.com/_/mariadb
* https://hub.docker.com/_/mysql

Usage
```
# ...
  roles:
  - role: dockered/mysql-run
    dockered_mysql_container_name: mysql # optional. defaults to "{{xfacts.system.ansible_managed_prefix}}-mysql"
    dockered_mysql_image: mysql:8.0.15 # optional. defaults to mariadb:10.3.14
    dockered_mysql_restart_policy: unless-stopped # optional. defaults to always
    dockered_mysql_network_mode: bridge # optional. defaults to host
    dockered_mysql_ports: # optional. defaults to []
    - "3306:3306"
    dockered_mysql_root_pass: abc # optional. defaults to qwerty
    dockered_mysql_user: myuser # optional. defaults to None
    dockered_mysql_pass: mypass # optional. defaults to None
    dockered_mysql_db: mydb # optional. default no None
    dockered_mysql_host_db_dir: /opt/database/mysql # optional. defaults to None
# ...
```
