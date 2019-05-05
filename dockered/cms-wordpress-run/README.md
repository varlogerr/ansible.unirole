Run wordpress in docker container.

Image documentation: https://hub.docker.com/_/wordpress

Usage
```
# ...
  roles:
  - role: dockered/cms-wordpress-run
    dockered_wordpress_container_name: mywordpress # optional. defaults to  "{{xfacts.system.ansible_managed_prefix}}-wordpress"
    dockered_wordpress_image_tag: 5.0.2-php7.0-apache # optional. defaults to 5.0.3-php7.3-apache
    dockered_wordpress_restart_policy: unless-stopped # optional. defaults always
    dockered_wordpress_network_mode: host # optional. defaults to bridge
    dockered_wordpress_dbhost: mysql-server.com # optional. defaults to 127.0.0.1
    dockered_wordpress_dbuser: dbuser # optional. default to root
    dockered_wordpress_dbpass: dbpass # optional. default to qwerty
    dockered_wordpress_dbname: dbname # optional. default to wordpress
    dockered_wordpress_volumes: # optional. defaults to []
    - "/var/www/wordpress:/var/www/html"
    dockered_wordpress_ports: # optional. defaults to []
    - "8080:80"
    dockered_wordpress_links: # optional. defaults to []
    - "mysqldb:mysql"
# ...
```
