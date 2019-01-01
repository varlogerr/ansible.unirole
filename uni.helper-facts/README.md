Usage
```
---
# ...
  roles:
  - role: uni.helper-facts
# ...
```

Produces helper facts
```
helper_facts:
  distro: # abstracts away distro info
    name: "..." # distro name
    codename: "..." # distro code name
    ubuntu_codename: "..." # (for debian-based only) distro ubuntu equivalent code name
    osfamily: "..." # distro os family
  user: # abstracts away ansible user data
    uid: "..." # ansible user id
    gid: "..." # ansible user group id
    name: "..." # ansible user name
    group: "..." # ansible user group
    homedir: "..." # ansible user home directory
```
