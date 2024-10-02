#!/bin/bash

# Ask for sudo password at the beginning
echo "This script requires sudo privileges. Please enter your password."
sudo -v

# Check if the password was entered correctly
if [ $? -ne 0 ]; then
    echo "Sudo authentication failed. Exiting."
    exit 1
fi

# Ensure Flatpak is installed
if ! command -v flatpak &> /dev/null; then
    echo "Flatpak is not installed. Please install Flatpak first."
    exit 1
fi

# List of Flatpak apps to install
FLATPAK_APPS=(
    "org.gnome.DejaDup"
    "io.missioncenter.MissionCenter"
    "com.raggesilver.BlackBox"
    "it.mijorus.collector"
    "com.github.tchx84.Flatseal"
    "com.usebottles.bottles"
    "de.haeckerfelix.Fragments"
    "org.gnome.Firmware"
    "org.gnome.Papers"
    "com.github.ADBeveridge.Raider"
    "io.github.tfuxu.Halftone"
    "org.gnome.gitlab.YaLTeR.Identity"
    "com.github.huluti.Curtail"
    "io.gitlab.adhami3310.Converter"
    "com.belmoussaoui.Decoder"
    "com.belmoussaoui.Obfuscate"
    "io.gitlab.gregorni.Letterpress"
    "md.obsidian.Obsidian"
    "io.github.celluloid_player.Celluloid"
    "org.gnome.Loupe"
    "com.github.tenderowl.frog"
)

# Function to install Flatpak apps
install_flatpak_apps() {
    for app in "${FLATPAK_APPS[@]}"; do
        echo "Installing $app..."
        sudo flatpak install -y flathub "$app" || {
            echo "Failed to install $app. Please check the output."
            continue
        }
        echo "$app installed successfully!"
    done
}

# Call the installation function
install_flatpak_apps

echo "All specified Flatpak apps have been processed successfully!"
