Run joomla in docker container.

Image documentation: https://hub.docker.com/_/joomla

Usage
```
# ...
  roles:
  - role: dockered-cms-joomla-run
    dockered_joomla_container_name: myjoomla # optional. defaults to  "{{xfacts.system.ansible_managed_prefix}}-joomla"
    dockered_joomla_image_tag: 3.9.2-php7.2-apache # optional. defaults to 3.9.2-php7.3-apache
    dockered_joomla_restart_policy: unless-stopped # optional. defaults always
    dockered_joomla_network_mode: host # optional. defaults to bridge
    dockered_joomla_dbhost: mysql-server.com # optional. defaults to 127.0.0.1
    dockered_joomla_dbuser: dbuser # optional. default to root
    dockered_joomla_dbpass: dbpass # optional. default to qwerty
    dockered_joomla_dbname: dbname # optional. default to joomla
    dockered_joomla_volumes: # optional. defaults to []
    - "/var/www/joomla:/var/www/html"
    dockered_joomla_ports: # optional. defaults to []
    - "8080:80"
    dockered_joomla_links: # optional. defaults to []
    - "mysqldb:mysql"
# ...
```
