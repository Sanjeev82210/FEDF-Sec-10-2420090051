#!/bin/bash

# Arch Linux + Hyprland Dotfiles Installation Script
# This script installs necessary packages and copies dotfiles to the appropriate locations

set -e

echo "================================================"
echo "Arch Linux + Hyprland Dotfiles Setup"
echo "================================================"
echo ""

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

print_info() {
    echo -e "${YELLOW}[i]${NC} $1"
}

# Check if running on Arch Linux
if [ ! -f /etc/arch-release ]; then
    print_error "This script is intended for Arch Linux only!"
    exit 1
fi

print_success "Detected Arch Linux"

# Update system
print_info "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install Hyprland and essential packages
print_info "Installing Hyprland and essential packages..."
sudo pacman -S --needed --noconfirm \
    hyprland \
    waybar \
    kitty \
    rofi \
    dunst \
    polkit-gnome \
    xdg-desktop-portal-hyprland \
    qt5-wayland \
    qt6-wayland \
    grim \
    slurp \
    wl-clipboard \
    brightnessctl \
    pavucontrol \
    pipewire \
    wireplumber \
    pipewire-audio \
    pipewire-pulse \
    playerctl \
    thunar \
    ttf-jetbrains-mono-nerd \
    papirus-icon-theme \
    neofetch

print_success "Packages installed successfully"

# Backup existing configs
print_info "Backing up existing configurations..."
BACKUP_DIR="$HOME/.config/dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

if [ -d "$HOME/.config/hypr" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.config/hypr" "$BACKUP_DIR/"
    print_info "Backed up hypr config to $BACKUP_DIR"
fi

if [ -d "$HOME/.config/waybar" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.config/waybar" "$BACKUP_DIR/"
    print_info "Backed up waybar config to $BACKUP_DIR"
fi

if [ -d "$HOME/.config/kitty" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.config/kitty" "$BACKUP_DIR/"
    print_info "Backed up kitty config to $BACKUP_DIR"
fi

if [ -d "$HOME/.config/rofi" ]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$HOME/.config/rofi" "$BACKUP_DIR/"
    print_info "Backed up rofi config to $BACKUP_DIR"
fi

if [ -f "$HOME/.bashrc" ]; then
    mkdir -p "$BACKUP_DIR"
    cp "$HOME/.bashrc" "$BACKUP_DIR/"
    print_info "Backed up .bashrc to $BACKUP_DIR"
fi

# Copy dotfiles
print_info "Copying dotfiles to ~/.config..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy config directories
cp -r "$SCRIPT_DIR/.config/hypr" "$HOME/.config/"
cp -r "$SCRIPT_DIR/.config/waybar" "$HOME/.config/"
cp -r "$SCRIPT_DIR/.config/kitty" "$HOME/.config/"
cp -r "$SCRIPT_DIR/.config/rofi" "$HOME/.config/"

# Copy .bashrc
cp "$SCRIPT_DIR/.bashrc" "$HOME/"

print_success "Dotfiles copied successfully"

print_success "Dotfiles setup complete"

echo ""
echo "================================================"
echo "Installation Complete!"
echo "================================================"
echo ""
print_info "To start Hyprland, run: Hyprland"
print_info "Or if using a display manager, select Hyprland from the session menu"
echo ""
print_info "Key bindings:"
echo "  SUPER + Return    : Open terminal (Kitty)"
echo "  SUPER + Q         : Close window"
echo "  SUPER + R         : Open application launcher (Rofi)"
echo "  SUPER + E         : Open file manager (Thunar)"
echo "  SUPER + F         : Toggle fullscreen"
echo "  SUPER + V         : Toggle floating"
echo "  SUPER + 1-9       : Switch workspaces"
echo "  SUPER + SHIFT + 1-9 : Move window to workspace"
echo ""
print_success "Enjoy your new Hyprland setup!"
