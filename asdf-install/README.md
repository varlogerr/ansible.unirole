Install asdf vm and apps

[Github][asdf-github]

Usage
```
---
# ...
  roles:
  - role: asdf-install
    asdf_version: v0.6.3 # optional. defaults to v0.7.1
    asdf_dir: "{{ xfacts.user.homedir }}/.myasdf" # optional. defaults to "{{ xfacts.user.homedir }}/.asdf"
    asdf_apps: # optional. defaults to []
    - name: desk                    # required
      versions:                     # optional. If absent or empty [], only plugin will be installed
        - 0.6.0
      global: 0.6.0                 # optional. Set global version
      repo: https://github.com/varlogerr/asdf-desk  # optional. Repo to pull plugin from
    - name: erlang
      versions:
      - "22.0"
      global: "22.0"
      prefix: "KERL_BUILD_DOCS=yes" # optional. Prefixes 'asdf install'
    - name: elixir
      versions:
      - 1.8.2
    - name: golang
      versions:
      - 1.12.5
      global: 1.12.5
    - name: nodejs
      versions:
      - 10.15.3
      - 12.2.0
      global: 10.15.3
    - name: rebar
      versions:
      - 3.9.1
# ...
```

Known issues:  
- [Unable to compile Erlang with wx][erlang memory leak]. Solution - increase memory  
- [Unable to install node][node-checksum]. Solution - implemented in the role as prepending `asdf install` with `NODEJS_CHECK_SIGNATURES=no` and same prefix is added to bashrc. Impact: signing key security goes to `/dev/null`, so don't use in prod

Articles:  
- [Installing Erlang,Cowboy on Amazon EC2, Detailed Steps With Commands (CentOS)][erlang on amazon centos]  
- [Erlang and Elixir: Managing Multiple versions with asdf (Ubuntu)][erlang and elixir with asdf ubuntu]  
- [asdf erlang readme][asdf erlang readme]  

[asdf-github]: https://github.com/asdf-vm/asdf
[erlang memory leak]: https://github.com/asdf-vm/asdf-erlang/issues/91
[node-checksum]: https://github.com/asdf-vm/asdf-nodejs/issues/82
[erlang on amazon centos]: https://medium.com/@tojeevansingh/when-i-stopped-scripting-and-started-implementing-begun-with-installing-erlang-cowboy-on-amazon-fca282dc8ee
[erlang and elixir with asdf ubuntu]: https://adhikary.net/2018/04/14/erlang-and-elixir-managing-multiple-versions-with-asdf/
[asdf erlang readme]: https://github.com/asdf-vm/asdf-erlang/blob/master/README.md
