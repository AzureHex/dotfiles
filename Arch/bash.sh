#!/bin/bash

# Prompt for sudo password
echo "This script requires sudo privileges. Please enter your password."
sudo -v

# Check if the password was entered correctly
if [ $? -ne 0 ]; then
    echo "Sudo authentication failed. Exiting."
    exit 1
fi

# Set the timezone to Asia/Kolkata
echo "Setting timezone to Asia/Kolkata..."
sudo timedatectl set-timezone "Asia/Kolkata"

# Update package lists
echo "Updating package lists..."
sudo apt update -y

# Upgrade installed packages
echo "Upgrading installed packages..."
sudo apt upgrade -y

# Perform distribution upgrade (if necessary)
echo "Performing distribution upgrade (upgrades packages intelligently)..."
sudo apt dist-upgrade -y

# Clean up unnecessary packages
echo "Cleaning up unnecessary packages..."
sudo apt autoremove -y

# Install Flatpak
echo "Installing Flatpak..."
sudo apt install flatpak -y

# Add Flathub remote repository
echo "Adding Flathub repository for Flatpak applications..."
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install specified packages
echo "Installing additional packages..."
sudo apt install bat zsh curl wget git fastfetch duf tree tldr glances btop powertop speedtest-cli samba neovim tmux -y

# Notify user of completion
echo "The update, installation of Flatpak, additional packages, and timezone configuration have been completed."

# Prompt for reboot at the end
read -p "Would you like to reboot now? (y/n): " choice
if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Rebooting..."
    sudo reboot
else
    echo "You can reboot later using 'sudo reboot'."
fi

echo "Update, upgrade, installation of Flatpak, additional packages, and timezone setting completed successfully!"
