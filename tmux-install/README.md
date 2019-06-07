Install tmux

Usage
```
---
# ...
  roles:
  - role: tmux-install
    tmux_plugins: # optional. defaults to []
    - tmux-plugins/tmux-sensible
    - tmux-plugins/tmux-resurrect
    - tmux-plugins/tmux-sidebar
    tmux_settings: # optional. defaults to []
    - set -g renumber-windows on
    - set -g base-index 1
    - setw -g pane-base-index 1
    - set -g display-panes-time 3000
# ...
```
