Add launchpad.net ppa

Usage
```
# ...
  roles:
  - role: uni.helper-launchpad-ppa
    helper_launchpad_ppa:
      ppa: ondrej/php # ppa name, required
      fingerprint: 14AA40EC0831756756D7F66C4F4EA0AAE5267A6C # fingerprint, required
      listname: ondrej-php # list filename, optional. defaults to a file name based on the repository source url
      ubuntu_codename: "xenial" # distro codename, optional. defaults to {{ xfacts.distro.ubuntu_codename }}
# ...
```
