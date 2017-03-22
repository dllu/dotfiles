function fish_prompt
    set_color green
    echo -n (basename $PWD)
    set_color blue
    echo -n ' > '
end

set fish_greeting ""

alias vim nvim

set EDITOR nvim

fish_vi_key_bindings

function fish_user_key_bindings
    bind \cf accept-autosuggestion
end
