# Setup fzf
# ---------
if [[ ! "$PATH" == *{{ fzf_bin_prefix }}/bin* ]]; then
  export PATH="${PATH:+${PATH}:}{{ fzf_bin_prefix }}/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "{{ fzf_src_dir }}/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "{{ fzf_src_dir }}/shell/key-bindings.bash"
