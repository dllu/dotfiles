function fish_prompt
    set_color -o blue
    echo -n (basename $PWD)
    set_color magenta
    echo -n ' » '
    set_color normal
end

set fish_greeting ""

# Catppuccin Latte shell and completion colors.
set -g fish_color_normal 4c4f69
set -g fish_color_command 1e66f5
set -g fish_color_keyword 8839ef
set -g fish_color_quote 40a02b
set -g fish_color_redirection ea76cb
set -g fish_color_end fe640b
set -g fish_color_error d20f39
set -g fish_color_param 4c4f69
set -g fish_color_comment 6c6f85
set -g fish_color_selection --background=ccd0da
set -g fish_color_search_match --background=ccd0da
set -g fish_color_operator 179299
set -g fish_color_escape e64553
set -g fish_color_autosuggestion 8c8fa1
set -g fish_color_cwd 1e66f5
set -g fish_color_cwd_root d20f39
set -g fish_color_valid_path --underline
set -g fish_color_history_current --bold
set -g fish_color_status d20f39
set -g fish_color_cancel d20f39
set -g fish_pager_color_prefix 8839ef
set -g fish_pager_color_completion 4c4f69
set -g fish_pager_color_description 6c6f85
set -g fish_pager_color_progress 6c6f85
set -g fish_pager_color_selected_background --background=ccd0da
set -g fish_pager_color_selected_prefix 8839ef
set -g fish_pager_color_selected_completion 4c4f69
set -g fish_pager_color_selected_description 5c5f77

set -l dircolors_config "$HOME/.config/.dircolors"
if set -q XDG_CONFIG_HOME
    set dircolors_config "$XDG_CONFIG_HOME/.dircolors"
end
if command -q dircolors; and test -r "$dircolors_config"
    set -gx LS_COLORS (dircolors -b "$dircolors_config" | string match --groups-only --regex "^LS_COLORS='(.*)';\$")
end

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
