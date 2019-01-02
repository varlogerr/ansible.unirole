Install package from launchpad.net

Usage
```
---
# ...
  roles:
  - role: uni.helper-launchpad-pkg
    helper_launchpad_pkg:
      pkg: git # package name, required
      ppa: git-core/ppa # ppa name, required
      fingerprint: E1DD270288B4E6030699E45FA1715D88E1DF1F24 # ppa fingerprint, required
      listname: git # list filename, optional. defaults to a file name based on the repository source url
      ubuntu_codename: bionic # distro codename, optional. defaults to {{ xfacts.distro.ubuntu_codename }}
# ...
```
