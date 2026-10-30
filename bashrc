#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

alias ls='ls --color=auto'
alias vim='nvim'
# Use the terminal's Latte ANSI palette and default foreground between segments.
export PS1='\[\e[31m\]\h\[\e[0m\]: \[\e[32m\]\W\[\e[0m\] \[\e[34m\]\$\[\e[0m\] '


PATH=$PATH:/home/dllu/sync/scripts
export PATH

export EDITOR="nvim"

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export MAKEFLAGS="-j16"

if command -v dircolors >/dev/null && [[ -r "${XDG_CONFIG_HOME:-$HOME/.config}/.dircolors" ]]; then
    eval "$(dircolors -b "${XDG_CONFIG_HOME:-$HOME/.config}/.dircolors")"
fi
. "$HOME/.cargo/env"
export GPG_TTY=$(tty)

# uv
export PATH="/home/dllu/.local/bin:$PATH"

. /home/dllu/sync/api_keys.sh

. "$HOME/.local/bin/env"

# sparkrun tab-completion
eval "$(_SPARKRUN_COMPLETE=bash_source sparkrun)"

# Pi launchers select their own Node; remove its bin directory from inherited PATHs.
_pi_runtime_bin="$HOME/.local/share/pi-node/node-v22.23.2-linux-arm64/bin"
while [[ ":$PATH:" == *":$_pi_runtime_bin:"* ]]; do
    PATH=":$PATH:"
    PATH=${PATH/:"$_pi_runtime_bin":/:}
    PATH=${PATH#:}
    PATH=${PATH%:}
done
unset _pi_runtime_bin
export PATH
hash -r
