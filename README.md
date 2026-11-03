# dotfiles

Personal dotfiles for Omarchy Linux (Arch-based) with Hyprland, Neovim, tmux, and custom shell configuration.

## Components

| Component | Description |
| ----------- | ------------- |
| **Hyprland** | Wayland compositor configuration (keybindings, window rules, monitors, input, appearance) |
| **Neovim** | LazyVim-based configuration with Lua |
| **tmux** | Terminal multiplexer configuration |
| **Omarchy Shell** | Custom shell configuration (aliases, functions, prompt) |

## Directory Structure

```
dotfiles/
├── hypr/           # Hyprland configuration
│   ├── hyprland.lua       # Main config (imports other modules)
│   ├── bindings.lua       # Keybindings
│   ├── windowrule.lua     # Window rules
│   ├── monitors.lua       # Monitor configuration
│   ├── input.lua          # Input/keyboard settings
│   ├── looknfeel.lua      # Appearance (gaps, borders, blur, animations)
│   ├── autostart.lua      # Autostart applications
│   ├── hyprsunset.conf    # Night light configuration
│   └── xdph.conf          # XDG portal configuration
├── nvim/           # Neovim configuration (LazyVim)
│   ├── init.lua           # Entry point
│   ├── lazyvim.json       # LazyVim extras
│   ├── lua/               # Custom Lua modules
│   └── stylua.toml        # Stylua formatter config
├── tmux/           # tmux configuration
│   └── tmux.conf          # Main tmux config
├── omarhcy/        # Omarchy shell configuration
│   └── shell.json         # Shell aliases, functions, prompt
├── install.sh      # Installation script (creates symlinks with interactive selection)
└── .stowrc         # GNU Stow configuration (kept for reference, not used by install.sh)
```

## Installation

### Prerequisites

- Omarchy Linux (or Arch-based distro with Hyprland)
- Neovim ≥ 0.9
- tmux
- Required fonts (JetBrains Mono Nerd Font recommended)

### Install using the install script

```bash
# Clone the repository
git clone https://github.com/yourusername/dotfiles.git ~/.local/share/dotfiles
cd ~/.local/share/dotfiles

# Run the install script (will ask for all or individual components)
./install.sh
```

The script will:

1. Ask whether to install all components or select individual ones.
2. For each selected component, create a symlink from `~/.config/<component>` to the dotfiles directory.
3. If a target already exists, it will be backed up with a `.backup` extension.

### Manual Installation (Alternative)

If you prefer to manually create symlinks:

```bash
mkdir -p ~/.config
ln -s ~/.local/share/dotfiles/hypr ~/.config/hypr
ln -s ~/.local/share/dotfiles/nvim ~/.config/nvim
ln -s ~/.local/share/dotfiles/tmux ~/.config/tmux
ln -s ~/.local/share/dotfiles/omarhcy ~/.config/omarhcy
```

## Post-Installation

1. **Hyprland**: Reload with `SUPER+SHIFT+R` or restart Hyprland
2. **Neovim**: Run `nvim` - LazyVim will bootstrap plugins on first launch
3. **tmux**: Reload with `tmux source ~/.config/tmux/tmux.conf`
4. **Shell**: Restart your shell or run `source ~/.bashrc` / `source ~/.zshrc`

## Keybindings (Hyprland)

| Key | Action |
| ----- | -------- |
| `SUPER+Q` | Close window |
| `SUPER+SHIFT+Q` | Kill window |
| `SUPER+ENTER` | Open terminal |
| `SUPER+D` | Application launcher (rofi/wofi) |
| `SUPER+SHIFT+D` | Run command |
| `SUPER+E` | File manager |
| `SUPER+V` | Clipboard history |
| `SUPER+SHIFT+R` | Reload Hyprland config |
| `SUPER+M` | Toggle fullscreen |
| `SUPER+F` | Toggle floating |
| `SUPER+[1-9]` | Switch workspace |
| `SUPER+SHIFT+[1-9]` | Move window to workspace |

See `hypr/bindings.lua` for complete keybindings.

## Updating

```bash
cd ~/.local/share/dotfiles
git pull
# Re-run install.sh if new configs were added
./install.sh
```

## Customization

- **Hyprland**: Edit files in `hypr/` - changes apply on reload (`SUPER+SHIFT+R`)
- **Neovim**: Edit `nvim/lua/` - LazyVim hot-reloads on save
- **tmux**: Edit `tmux/tmux.conf` - reload with `tmux source ~/.config/tmux/tmux.conf`
- **Shell**: Edit `omarhcy/shell.json` - restart shell to apply

## Backup

To backup your current configs before installing:

```bash
mkdir -p ~/.config.backup
mv ~/.config/hypr ~/.config.backup/
mv ~/.config/nvim ~/.config.backup/
mv ~/.config/tmux ~/.config.backup/
mv ~/.config/omarhcy ~/.config.backup/
```

## License

MIT License - Feel free to use and modify.
