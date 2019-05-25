Create completions directory and source it to bashrc

Usage
```
---
# ...
  roles:
  - role: bash-completion
    bash_completion_dir: "{{ xfacts.user.homedir }}/.mycompletions" # optional. defaults to "{{ xfacts.user.homedir }}/.completions"
# ...
```
