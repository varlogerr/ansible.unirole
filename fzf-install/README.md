Install fzf

Demo usage
```
---
# ...
  roles:
  - role: fzf-install
    fzf_version: 0.17.0 # optional. defaults to 0.18.0
    fzf_install_prefix: /some/path # optional. defaults to "{{ xfacts.user.homedir }}/.fzf"
# ...
```
