Configure ssh keys

Usage
```
---
# ...
  roles:
  - role: ssh-keys
    ssh_keys_list: # optional. defaults to []
    - path: "{{ ssh_keys_dir }}/homevc/github.com" # base key file name, required
      public_file: <public key path>               # public key file path, required
      private_file: <private key path>             # private key file path, required
      config: |                                    # configuration, optional
        Host github.com
        HostName github.com
        User git
        IdentityFile ~/.ssh/github.com
        IdentitiesOnly yes
# ...
```
