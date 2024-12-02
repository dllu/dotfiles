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
