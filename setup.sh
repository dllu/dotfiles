#!/bin/bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"

link_config() {
    local source="$repo_dir/$1" destination="$2"
    mkdir -p -- "$(dirname -- "$destination")"

    if [[ -L "$destination" && "$(readlink -- "$destination")" == "$source" ]]; then
        return
    fi
    if [[ -e "$destination" || -L "$destination" ]]; then
        local backup="$destination.backup.$(date +%Y%m%d-%H%M%S-%N)"
        mv -- "$destination" "$backup"
        printf 'Backed up %s to %s\n' "$destination" "$backup"
    fi
    ln -s -- "$source" "$destination"
}

link_config init.lua "$config_dir/nvim/init.lua"
link_config helix.toml "$config_dir/helix/config.toml"
link_config i3config "$config_dir/i3/config"
link_config swayconfig "$config_dir/sway/config"
link_config config.fish "$config_dir/fish/config.fish"
link_config Xresources "$config_dir/Xresources"
link_config fonts.conf "$config_dir/fontconfig/fonts.conf"
link_config alacritty.toml "$config_dir/alacritty/alacritty.toml"
link_config rofi.rasi "$config_dir/rofi/dllu.rasi"
link_config fastfetch/config.jsonc "$config_dir/fastfetch/config.jsonc"
link_config sriv/config.toml "$config_dir/sriv/config.toml"
link_config sriv/bindings.toml "$config_dir/sriv/bindings.toml"
link_config neofetch.conf "$config_dir/neofetch/config.conf"
link_config pup.txt "$config_dir/neofetch/pup.txt"
link_config user-dirs.dirs "$config_dir/user-dirs.dirs"
link_config rtorrent.rc "$HOME/.rtorrent.rc"
link_config waybar_config "$config_dir/waybar/config"
link_config waybar_style.css "$config_dir/waybar/style.css"
link_config dircolors.latte "$config_dir/.dircolors"
link_config bashrc "$HOME/.bashrc"
