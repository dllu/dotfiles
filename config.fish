function fish_prompt
    set_color -o blue
    echo -n (basename $PWD)
    set_color purple
    echo -n ' » '
end

set fish_greeting ""

alias vim nvim
alias sxiv nsxiv

alias ssh 'TERM=xterm-256color /usr/bin/ssh'

set -x EDITOR nvim

fish_vi_key_bindings

function fish_user_key_bindings
    bind \cf accept-autosuggestion
end
function fish_mode_prompt
    # NOOP - Disable vim mode indicator
end
fish_add_path /home/dllu/.cargo/bin
# Pi's launcher selects its own Node; keep system Node and npm on PATH.
set -l pi_runtime_bin /home/dllu/.local/share/pi-node/node-v22.23.2-linux-arm64/bin
set -U fish_user_paths (string match -v -- $pi_runtime_bin $fish_user_paths)
set -gx PATH (string match -v -- $pi_runtime_bin $PATH)
fish_add_path /home/dllu/.local/bin

set -x GPG_TTY (tty)
