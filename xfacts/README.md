Usage
```
---
# ...
  roles:
  - role: xfacts
# ...
```

Produces extra facts
```
xfacts:
  distro: # abstracts away distro info
    name: "..." # distro name
    osfamily: "..." # distro os family
    codename: "..." # (debian-based only) distro code name
    ubuntu_codename: "..." # (debian-based only) distro ubuntu equivalent code name
    major_version: "..." # (red hat-based only) distro major version
    minor_version: "..." # (red hat-based only) distro minor version
    full_version: "..." # (red hat-based only) distro version
  user: # abstracts away ansible user data
    uid: "..." # ansible user id
    gid: "..." # ansible user group id
    name: "..." # ansible user name
    group: "..." # ansible user group
    homedir: "..." # ansible user home directory
```
