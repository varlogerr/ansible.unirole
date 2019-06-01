Install tmux

Usage
```
---
# ...
  roles:
  - role: tmux-install
    tmux_plugins: # optional. defaults to []
    - tmux-plugins/tmux-resurrect
    tmux_settings: # optional. defaults to []
    - setw -g mouse on
# ...
```
