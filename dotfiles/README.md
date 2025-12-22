# Arch Linux + Hyprland Dotfiles

A complete and modern dotfiles configuration for Arch Linux with Hyprland window manager. This setup provides a beautiful, efficient, and customizable desktop environment using Wayland.

## 🎨 Features

- **Hyprland**: Dynamic tiling Wayland compositor
- **Waybar**: Highly customizable status bar
- **Kitty**: Fast, feature-rich terminal emulator
- **Rofi**: Application launcher and window switcher
- **Catppuccin Mocha**: Beautiful color scheme throughout
- **Complete keybindings**: Vim-style navigation and more
- **Media controls**: Volume, brightness, and playback controls
- **Animations**: Smooth window animations and effects

## 📦 Included Components

### Core
- Hyprland configuration with sensible defaults
- Custom theme with Catppuccin Mocha colors
- Window rules and animations

### Status Bar (Waybar)
- Workspaces indicator
- Clock with date
- CPU, memory, and temperature monitoring
- Network status
- Battery indicator with charging status
- Volume control
- Brightness control
- System tray

### Terminal (Kitty)
- Catppuccin Mocha theme
- JetBrains Mono Nerd Font
- Transparency support
- Tab support with powerline style

### Application Launcher (Rofi)
- Custom Catppuccin theme
- Icon support
- Multiple modes (apps, run, windows)

### Shell Configuration
- Enhanced bash configuration
- Useful aliases for Arch Linux
- Git shortcuts
- Wayland environment variables

## 🚀 Quick Start

### Prerequisites

- Arch Linux installation
- Internet connection
- Root/sudo access

### Installation

1. Clone this repository or download the dotfiles:
```bash
git clone https://github.com/Sanjeev82210/FEDF-Sec-10-2420090051.git
cd FEDF-Sec-10-2420090051/dotfiles
```

2. Run the installation script:
```bash
./install.sh
```

The script will:
- Update your system
- Install all necessary packages
- Backup your existing configurations
- Copy the new dotfiles to appropriate locations

3. Start Hyprland:
```bash
Hyprland
```

Or select Hyprland from your display manager's session menu.

## ⌨️ Key Bindings

### Application Shortcuts
| Keybinding | Action |
|------------|--------|
| `SUPER + Return` | Open terminal (Kitty) |
| `SUPER + Q` | Close active window |
| `SUPER + M` | Exit Hyprland |
| `SUPER + E` | Open file manager (Thunar) |
| `SUPER + R` | Open application launcher (Rofi) |
| `SUPER + V` | Toggle floating mode |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + J` | Toggle split (dwindle) |

### Window Navigation
| Keybinding | Action |
|------------|--------|
| `SUPER + Arrow Keys` | Move focus |
| `SUPER + H/J/K/L` | Move focus (Vim style) |

### Workspace Management
| Keybinding | Action |
|------------|--------|
| `SUPER + 1-9` | Switch to workspace 1-9 |
| `SUPER + SHIFT + 1-9` | Move window to workspace 1-9 |
| `SUPER + Mouse Scroll` | Switch workspaces |

### Window Management
| Keybinding | Action |
|------------|--------|
| `SUPER + Left Mouse` | Move window |
| `SUPER + Right Mouse` | Resize window |

### Media Controls
| Keybinding | Action |
|------------|--------|
| `XF86AudioRaiseVolume` | Increase volume |
| `XF86AudioLowerVolume` | Decrease volume |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioNext` | Next track |
| `XF86AudioPrev` | Previous track |
| `XF86MonBrightnessUp` | Increase brightness |
| `XF86MonBrightnessDown` | Decrease brightness |

### Screenshots
| Keybinding | Action |
|------------|--------|
| `Print` | Take area screenshot (selection) |
| `SHIFT + Print` | Take full screenshot |

## 🎨 Customization

### Colors
The theme uses Catppuccin Mocha color scheme. To customize colors, edit:
- `~/.config/hypr/theme.conf` - Hyprland colors
- `~/.config/waybar/style.css` - Waybar colors
- `~/.config/kitty/kitty.conf` - Terminal colors
- `~/.config/rofi/catppuccin-mocha.rasi` - Rofi colors

### Keybindings
Edit `~/.config/hypr/hyprland.conf` to modify keybindings. Look for the `# Key bindings` section.

### Waybar Modules
Customize which modules appear on Waybar by editing `~/.config/waybar/config`.

## 📦 Installed Packages

The installation script installs the following packages:

**Core:**
- hyprland
- waybar
- kitty
- rofi
- dunst

**System:**
- polkit-gnome
- xdg-desktop-portal-hyprland
- qt5-wayland
- qt6-wayland

**Utilities:**
- grim (screenshots)
- slurp (area selection)
- wl-clipboard (clipboard)
- brightnessctl (brightness control)
- pavucontrol (audio control)
- playerctl (media control)
- thunar (file manager)

**Audio:**
- pipewire
- wireplumber
- pipewire-audio
- pipewire-pulse

**Fonts & Themes:**
- ttf-jetbrains-mono-nerd
- papirus-icon-theme

**Extras:**
- neofetch

## 🐛 Troubleshooting

### Hyprland won't start
- Check if your GPU supports Vulkan
- Ensure all required packages are installed
- Check the log: `~/.local/share/hyprland/hyprland.log`

### Waybar not showing
- Restart Waybar: `killall waybar && waybar &`
- Check configuration syntax: `waybar -c ~/.config/waybar/config`

### No sound
- Check if pipewire is running: `systemctl --user status pipewire`
- Start pipewire: `systemctl --user start pipewire pipewire-pulse wireplumber`

### Display issues
- Adjust monitor settings in `~/.config/hypr/hyprland.conf`
- Use `hyprctl monitors` to see available monitors

## 📚 Resources

- [Hyprland Wiki](https://wiki.hyprland.org/)
- [Waybar Documentation](https://github.com/Alexays/Waybar)
- [Kitty Documentation](https://sw.kovidgoyal.net/kitty/)
- [Rofi Documentation](https://github.com/davatorium/rofi)
- [Arch Linux Wiki](https://wiki.archlinux.org/)

## 📝 File Structure

```
dotfiles/
├── .config/
│   ├── hypr/
│   │   ├── hyprland.conf    # Main Hyprland configuration
│   │   └── theme.conf       # Color theme
│   ├── waybar/
│   │   ├── config           # Waybar configuration
│   │   └── style.css        # Waybar styling
│   ├── kitty/
│   │   └── kitty.conf       # Kitty terminal configuration
│   └── rofi/
│       ├── config.rasi      # Rofi configuration
│       └── catppuccin-mocha.rasi  # Rofi theme
├── .bashrc                  # Bash configuration
├── install.sh               # Installation script
└── README.md               # This file
```

## 🤝 Contributing

Feel free to fork this repository and customize it for your needs. If you have improvements or suggestions, pull requests are welcome!

## 📄 License

This configuration is provided as-is for educational and personal use.

## 🙏 Credits

- Color scheme: [Catppuccin](https://github.com/catppuccin/catppuccin)
- Window Manager: [Hyprland](https://hyprland.org/)
- Font: [JetBrains Mono](https://www.jetbrains.com/lp/mono/)
- Icons: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

---

**Enjoy your new Hyprland setup! 🎉**
