#!/usr/bin/env bash

# FIX: this script doesn't working so, do not run it.

# Exit immediately if a command fails
set -euo pipefail

# Clone the dotfiles repository into the home directory
echo "Cloning dotfiles repository..."
if ! git clone https://github.com/sudiplun/dotfiles.git ~/dotfiles 2>/dev/null; then
	echo "Dotfiles repository already exists or cloning failed." >&2
	read -rp "Continue with existing repository? [Y/n] " choice
	[[ "$choice" =~ ^[Nn]$ ]] && exit 1
fi

# System packages to install
system_packages=(
	wofi nautilus chromium ghostty alacritty obsidian keepassxc
	hyprctl waybar loginctl cliphist hyprpicker grim slurp wl-copy
	wpctl pamixer brightnessctl playerctl hypridle polkit-gnome
	wl-paste hyprsunset
)

# Display packages to be installed
echo -e "\nThe following system packages will be installed:"
printf ' - %s\n' "${system_packages[@]}"

# User confirmation
read -rp $'\nDo you want to proceed with installation? [Y/n] ' choice
if [[ "${choice,,}" =~ ^(n|no)$ ]]; then
	echo "Installation aborted by user."
	exit 0
fi

# Install packages with better error handling
echo -e "\nStarting package installation..."
if ! sudo pacman -Syu --needed --noconfirm "${system_packages[@]}"; then
	echo "Package installation failed." >&2
	exit 1
fi

# Use stow to manage the .config directory
echo -e "\nSetting up dotfiles with stow..."
mkdir -p ~/.config # Ensure .config directory exists

cd ~/dotfiles || exit

# Find directories to stow (excluding hidden dirs and current dir)
mapfile -t dir_array < <(find . -maxdepth 1 -type d ! -name "." ! -name ".*" -printf '%f\n')

if [[ ${#dir_array[@]} -eq 0 ]]; then
	echo "No directories found to stow." >&2
	exit 1
fi

echo "Found the following configurations to link:"
printf ' - %s\n' "${dir_array[@]}"

for dir in "${dir_array[@]}"; do
	echo "Linking $dir..."
	if ! stow -t ~/.config/"$dir" "$dir"; then
		echo "Failed to stow $dir" >&2
	fi
done

echo -e "\nDotfiles setup complete!"
