Install go (golang) from https://launchpad.net/~gophers/+archive/ubuntu/archive

It doesn't add go binaries to your path, you'll have to add it manually /usr/lib/go-{{ golang_install.version }}/bin

Usage
```
---
# ...
  roles:
  - role: golang-install
    golang_install:
      version: "1.9" # must be in quotes, optional. defaults to "1.10". currently available "1.{4..10}"
      full: true # whether install golang-{{ golang_install.version }} meta package or golang-{{ golang_install.version }}-go package, optional. defaults to false
# ...
```
