Install app from launchpad.net

Usage
```
---
# ...
  roles:
  - role: uni.helper-launchpad-installer
    helper_launchpad_installer:
      app: "..." # application name, required
      ppa: "..." # ppa name, required
      ppa_fingerprint: "..." # fingerpring, required
      listname: "..." # list filename, optional. if not specified app name will be used
# ...
```

Demo
```
# ...
  roles:
  - role: uni.helper-launchpad-installer
    helper_launchpad_installer:
      app: git
      ppa: git-core/ppa
      ppa_fingerprint: E1DD270288B4E6030699E45FA1715D88E1DF1F24
# ...
```
