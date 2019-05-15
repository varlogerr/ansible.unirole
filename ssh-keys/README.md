Configure ssh keys

Usage
```
---
# ...
  roles:
  - role: ssh-keys
    ssh_keys_list: # optional. defaults to []
    - path: "{{ ssh_keys_dir }}/homevc/github.com"  # base key file name, required
      public: <public key here>                     # public key text, required
      private: <private key here>                   # private key text, required
      config: |                                     # configuration, optional
        Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/github.com
        IdentitiesOnly yes
# ...
```
