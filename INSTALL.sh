#!/bin/bash

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
pip install numpy scipy pandas scikit-learn tensorflow keras torch torchvision

# Clean up
pacman -Scc --noconfirm
