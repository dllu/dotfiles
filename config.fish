function fish_prompt
    set_color -o purple
    echo -n (basename $PWD)
    set_color blue
    echo -n ' » '
end

set fish_greeting ""

alias vim nvim
alias sxiv nsxiv
alias fd fdfind

alias ssh 'TERM=xterm-256color /usr/bin/ssh'

set EDITOR nvim

fish_vi_key_bindings

function fish_user_key_bindings
    bind \cf accept-autosuggestion
end
function fish_mode_prompt
  # NOOP - Disable vim mode indicator
end
fish_add_path /home/dlu/scripts
fish_add_path /home/dlu/msa/infrastructure/scripts
