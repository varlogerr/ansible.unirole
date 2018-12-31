Add launchpad.net ppa

Usage
```
---
# ...
  roles:
  - role: uni.helper-launchpad-ppa
    helper_launchpad_ppa:
      ppa: "..." # ppa name, required
      fingerprint: "..." # fingerpring, required
      listname: "..." # list filename, optional. defaults to a file name based on the repository source url
      ubuntu_codename: "..." # distro codename, optional. defaults to {{ helper_facts_distro.ubuntu_codename }}
# ...
```

Demo
```
# ...
  roles:
  - role: uni.helper-launchpad-installer
    helper_launchpad_ppa:
      ppa: ondrej/php
      fingerprint: 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C
      listname: ondrej-php
# ...
```
