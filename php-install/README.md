Install php with composer and extensions

Usage
```
---
# ...
  roles:
  - role: php-install
    php_version: "7.2" # optional. defaults to "7.3"
    php_install_composer: true # optional. defaults to false
    php_extensions: # optional. defaults to []
      - mysqlnd
      - cli
      - gd
      - intl
      - mbstring
      - pdo
      - redis
      - xdebug
      - xml
      - zip
# ...
```
