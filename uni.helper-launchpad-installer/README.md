Install package from launchpad.net

Usage
```
---
# ...
  roles:
  - role: uni.helper-launchpad-installer
    helper_launchpad_installer:
      pkg: "..." # package name, required
      ppa: "..." # ppa name, required
      fingerprint: "..." # ppa fingerprint, required
      listname: "..." # list filename, optional. defaults to a file name based on the repository source url
      ubuntu_codename: "..." # distro codename, optional. defaults to {{ helper_facts_distro.ubuntu_codename }}
# ...
```

Demo
```
# ...
  roles:
  - role: uni.helper-launchpad-installer
    helper_launchpad_installer:
      pkg: git
      ppa: git-core/ppa
      fingerprint: E1DD270288B4E6030699E45FA1715D88E1DF1F24
# ...
```
