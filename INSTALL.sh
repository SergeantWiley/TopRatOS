#!/bin/bash


echo "      ░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗
      ░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝
      ░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░
      ░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░
      ░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗
      ░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝"

echo "this is the install script where you will be installing every thing that you need to make your ml and make your AI dreams come true."

echo "do want to continue with this install or do want Abort"

# Function to display usage information
usage() {
    echo "Usage: $0 {install|abort}"
    exit 1
}

# Function to install system packages using pacman
install_system_packages() {
    yes | sudo pacman -Syu
    yes | sudo pacman -Syu --noconfirm # Update package list and upgrade all packages
    yes | sudo pacman -S --noconfirm python python-pip sddm firefox calamares
}

# Function to install Python packages using pip
install_python_packages() {
    python_packages=(
        numpy
        scipy
        pandas
        scikit-learn
        tensorflow
        keras
        torch
        torchvision
    )

    for package in "${python_packages[@]}"; do
        pip install "$package"
    done
}

# Main script execution
if [ "$#" -ne 1 ]; then
    usage
fi

case "$1" in
    install)
        echo "Starting installation of system and Python packages..."
        install_system_packages
        install_python_packages
        echo "Installation completed successfully."
        ;;
    abort)
        echo "Installation aborted."
        exit 0
        ;;
    *)
        usage
        ;;
esac

# Function to install GNOME
install_gnome() {
    pacman -Syu --noconfirm gnome gnome-extra gdm
    systemctl enable gdm
}

# Function to install XFCE
install_xfce() {
    pacman -Syu --noconfirm xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
    systemctl enable lightdm
}

# Function to install KDE
install_kde() {
    pacman -Syu --noconfirm plasma kde-applications sddm
    systemctl enable sddm
}

# Prompt user to select a desktop environment
echo "Select a desktop environment to install:"
echo "1) GNOME"
echo "2) XFCE"
echo "3) KDE"
read -p "Enter choice [1-3]: " desktop_choice

case $desktop_choice in
    1)
        install_gnome
        ;;
    2)
        install_xfce
        ;;
    3)
        install_kde
        ;;
    *)
        echo "Invalid choice, exiting."
        exit 1
        ;;
esac

# Install machine learning packages
pacman -Syu --noconfirm python python-pip
pacman -S python-numpy python-scipy python-pandas python-scikit-learn python-tensorflow python-keras python-torch python-torchvision

# Function to delete a file
delete_file() {
    FILE_PATH="/usr/share/backgrounds/xfce/xfce"

    if [ -f "$FILE_PATH" ]; then
        sudo rm "$FILE_PATH"
        echo "File $FILE_PATH deleted successfully."
    else
        echo "File $FILE_PATH not found."
    fi
}

# Function to move a file
move_file() {
    SOURCE_FILE=~/TopRatOS/xfce
    DEST_DIR=/usr/share/backgrounds/xfce/

    if [ -f "$SOURCE_FILE" ]; then
        sudo mv "$SOURCE_FILE" "$DEST_DIR"
        echo "File $SOURCE_FILE moved to $DEST_DIR successfully."
    else
        echo "Source file $SOURCE_FILE not found."
    fi
}

# Clean up
pacman -Scc --noconfirm
