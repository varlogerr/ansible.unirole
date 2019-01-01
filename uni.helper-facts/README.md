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
  distro:
    name: "..." # distro name
    codename: "..." # distro code name
    ubuntu_codename: "..." # (for debian-based only) distro ubuntu equivalent code name
    osfamily: "..." # distro os family
```
