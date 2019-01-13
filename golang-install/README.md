Install go (golang) from https://launchpad.net/~gophers/+archive/ubuntu/archive

It doesn't add go binaries to your path, you'll have to add `/usr/lib/go-{{ golang_version }}/bin` manually

Usage
```
---
# ...
  roles:
  - role: golang-install
    golang_version: "1.9" # must be in quotes, optional. defaults to "1.10". currently available "1.{4..10}"
    golang_full: true # whether install golang-{{ golang_version }} meta package or golang-{{ golang_version }}-go package, optional. defaults to false
# ...
```
