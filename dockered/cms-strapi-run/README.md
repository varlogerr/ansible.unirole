Run strapi in docker container.

Image documentation: https://hub.docker.com/r/strapi/strapi

Usage
```
# ...
  roles:
  - role: dockered/cms-strapi-run
    dockered_strapi_container_name: mystrapi # optional. defaults to  "{{xfacts.system.ansible_managed_prefix}}-strapi"
    dockered_strapi_image_tag: 3.9.2-php7.2-apache # optional. defaults to 3.9.2-php7.3-apache
    dockered_strapi_restart_policy: unless-stopped # optional. defaults always
    dockered_strapi_network_mode: host # optional. defaults to bridge
    dockered_strapi_dbclient: mongo # optional. defaults to mysql
    dockered_strapi_dbhost: mysql-server.com # optional. defaults to 127.0.0.1
    dockered_strapi_dbport: 5500 # optional. defaults to "3306"
    dockered_strapi_dbuser: dbuser # optional. default to root
    dockered_strapi_dbpass: dbpass # optional. default to qwerty
    dockered_strapi_dbname: dbname # optional. default to strapi
    dockered_strapi_volumes: # optional. defaults to []
    - "/var/www/strapi:/usr/src/api/strapi-app"
    dockered_strapi_ports: # optional. defaults to []
    - "3000:1337"
    dockered_strapi_links: # optional. defaults to []
    - "mysqldb:mysql"
# ...
```
