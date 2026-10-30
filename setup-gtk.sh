#!/bin/bash
set -euo pipefail

repo_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
data_dir="${XDG_DATA_HOME:-$HOME/.local/share}"
theme_name='catppuccin-latte-mauve-standard+default'
theme_dir="$data_dir/themes/$theme_name"

command -v python3 >/dev/null
command -v gsettings >/dev/null

# Install the upstream release without running downloaded code.
python3 - "$theme_dir" <<'PY'
import hashlib
import io
from pathlib import Path, PurePosixPath
import sys
import urllib.request
import zipfile

theme_dir = Path(sys.argv[1])
required = ('gtk-3.0/gtk.css', 'gtk-4.0/gtk.css', 'gtk-4.0/gtk-dark.css')
if all((theme_dir / filename).is_file() for filename in required):
    print(f'GTK theme already installed: {theme_dir}')
    sys.exit(0)

url = ('https://github.com/catppuccin/gtk/releases/download/v1.0.3/'
       'catppuccin-latte-mauve-standard%2Bdefault.zip')
request = urllib.request.Request(url, headers={'User-Agent': 'dotfiles-theme-setup'})
with urllib.request.urlopen(request, timeout=30) as response:
    data = response.read()
expected = 'b19da9e3048dc9357a3e55f2592a4e006aaf5654ff228f846d7b21adf7c3273e'
if hashlib.sha256(data).hexdigest() != expected:
    raise SystemExit('GTK theme archive checksum mismatch')

with zipfile.ZipFile(io.BytesIO(data)) as archive:
    for member in archive.infolist():
        path = PurePosixPath(member.filename)
        if path.is_absolute() or '..' in path.parts:
            raise SystemExit(f'Invalid archive path: {member.filename}')
        # The archive also includes optional density variants; install standard.
        if path.parts[0] == theme_dir.name:
            archive.extract(member, theme_dir.parent)
print(f'Installed Catppuccin Latte GTK theme: {theme_dir}')
PY

link_file() {
    local source="$1" destination="$2"
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

link_file "$repo_dir/gtk-settings.ini" "$config_dir/gtk-3.0/settings.ini"
link_file "$repo_dir/gtk-settings.ini" "$config_dir/gtk-4.0/settings.ini"
for item in assets gtk.css gtk-dark.css; do
    link_file "$theme_dir/gtk-4.0/$item" "$config_dir/gtk-4.0/$item"
done
for desktop in sway i3; do
    link_file "$repo_dir/portals.conf" "$config_dir/xdg-desktop-portal/$desktop-portals.conf"
done

gsettings set org.gnome.desktop.interface gtk-theme "$theme_name"
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'
printf 'GTK theme set to Catppuccin Latte; desktop appearance set to light.\n'
