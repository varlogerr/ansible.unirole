Configure samba shares

It's not production ready by any means, only for private use in a LAN or virtualbox

Usage
```
---
# ...
  roles:
  - role: samba-shares
    # list of dirs to be created, optional. defaults to [].
    # each element of list should be a dict with valid parateres for
    # ansible file module. valid values for 'state' can be one
    # of ['directory', 'link', 'hard']. if not specified or has invalid
    # value defaults to 'directory'
    samba_shares_dirs:
    - path: "{{ xfacts.user.homedir }}/Share"
      owner: "{{ xfacts.user.name }}"
      group: "{{ xfacts.user.group }}"
      mode: "0775"
    # dictionary of share configuration, optional. defaults to {}.
    # dictionary keys serve for naming files, values fill their contents
    samba_shares_confs:
      Share: |
        [Share]
          available = yes
          path = {{ xfacts.user.homedir }}/Share
          guest ok = yes
          force user = {{ xfacts.user.name }}
          force group = {{ xfacts.user.group }}
          create mask = 0664
          force create mode = 0664
          directory mask = 0775
          force directory mode = 0775
# ...
```

dependencies:
- xfacts
- samba-install
