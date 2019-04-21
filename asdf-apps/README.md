Install asdf vm applications

Usage
```
---
# ...
  roles:
  - role: asdf-apps
    asdf_apps: # optional. defaults to []
    - name: golang     # required
      version: 1.11.4  # optional. If absent, only plugin will be installed
    - name: elixir
      version: 1.7.3
    - name: nodejs
      version: 10.15.0
    - name: rebar
      version: 3.6.0
# ...
```

dependencies:
- asdf-install
- asdf-plugins-deps-install

Issues:
* 'NODEJS_CHECK_SIGNATURES=no' for nodejs 'gpg: Can't check signature: No public key'. See https://github.com/asdf-vm/asdf-nodejs/issues/82 for details

* for erlang https://github.com/asdf-vm/asdf-erlang/issues/91
