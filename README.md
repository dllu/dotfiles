Personal settings and configurations for my computers.

The desktop uses [Catppuccin Latte](https://catppuccin.com/palette/) with a mauve
accent: Helix, Neovim (including lualine), Alacritty, Rofi, Waybar, Sway/i3,
Xresources, Fish, Bash, and directory listings.

Run `./setup.sh` to link the configs into `$XDG_CONFIG_HOME` (defaulting to
`~/.config`) and your home directory. Existing configs are kept as timestamped
`.backup.*` files; running setup again leaves matching symlinks alone. The
dircolors palette is tracked here as `dircolors.latte`, with no download at setup.

Helix uses its bundled `catppuccin_latte` theme and keeps soft wrapping enabled.
Neovim installs [catppuccin/nvim](https://github.com/catppuccin/nvim) through
lazy.nvim; on an existing installation, run `:Lazy sync` to install the theme and
remove the old Nightfox plugin. Both editors and dircolors use truecolor.
Alacritty's palette follows [catppuccin/alacritty](https://github.com/catppuccin/alacritty),
with a darker selection for readable text.

Reload Sway/i3 with `Mod+Shift+c`, restart Waybar, and reopen your editors and
shells after setup. Alacritty reloads its colors automatically; Rofi reads its
theme when launched. Run `xrdb -merge ~/.config/Xresources` for new X11 clients.

Run `./setup-gtk.sh` to install the pinned
[Catppuccin GTK v1.0.3 theme](https://github.com/catppuccin/gtk/releases/tag/v1.0.3)
with Latte/mauve colors and select the desktop's light appearance. It configures
GTK 3, GTK 4/libadwaita, and the appearance portal for Sway/i3. The theme is
installed into `$XDG_DATA_HOME/themes` (defaulting to `~/.local/share/themes`);
existing GTK configs are backed up before linking. Requires Python 3, gsettings,
and xdg-desktop-portal-gtk. After installing, run
`systemctl --user restart xdg-desktop-portal-gtk.service xdg-desktop-portal.service`
and reopen GTK apps to apply the theme.

Use at your own risk.
