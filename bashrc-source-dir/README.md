Create bashrc source directory and source it to bashrc

Usage
```
---
# ...
  roles:
  - role: bashrc-source-dir
    bashrc_source_dir: "{{ xfacts.user.homedir }}/.bashrc-src" # optional. defaults to "{{ xfacts.user.homedir }}/.bashrc-source"
# ...
```
