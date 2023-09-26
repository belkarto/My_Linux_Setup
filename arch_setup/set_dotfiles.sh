#!/bin/bash
source $HOME/My_Linux_Setup/arch_setup/dotfiles/scripts/library.sh
clear

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ------------------------------------------------------
# Create .config folder
# ------------------------------------------------------
echo ""
echo "-> Check if .config folder exists"

if [ -d ~/.config ]; then
    echo ".config folder already exists."
else
    mkdir ~/.config
    echo ".config folder created."
fi

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
# name symlink source target

echo ""
echo "-------------------------------------"
echo "-> Install general dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink alacritty ~/.config/alacritty ~/My_Linux_Setup/arch_setup/dotfiles/alacritty/ ~/.config
_installSymLink ranger ~/.config/ranger ~/My_Linux_Setup/arch_setup/dotfiles/ranger/ ~/.config
_installSymLink rofi ~/.config/rofi ~/My_Linux_Setup/arch_setup/dotfiles/rofi/ ~/.config
_installSymLink dunst ~/.config/dunst ~/My_Linux_Setup/arch_setup/dotfiles/dunst/ ~/.config
_installSymLink wal ~/.config/wal ~/My_Linux_Setup/arch_setup/dotfiles/wal/ ~/.config

echo "-------------------------------------"
echo "-> Install GTK dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink .gtkrc-2.0 ~/.gtkrc-2.0 ~/My_Linux_Setup/arch_setup/dotfiles/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
_installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/My_Linux_Setup/arch_setup/dotfiles/gtk/gtk-3.0/ ~/.config/
_installSymLink .Xresouces ~/.Xresources ~/My_Linux_Setup/arch_setup/dotfiles/gtk/.Xresources ~/.Xresources
_installSymLink .icons ~/.icons ~/My_Linux_Setup/arch_setup/dotfiles/gtk/.icons/ ~/

echo "-------------------------------------"
echo "-> Install Hyprland dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink hypr ~/.config/hypr ~/My_Linux_Setup/arch_setup/dotfiles/hypr/ ~/.config
_installSymLink waybar ~/.config/waybar ~/My_Linux_Setup/arch_setup/dotfiles/waybar/ ~/.config
_installSymLink swaylock ~/.config/swaylock ~/My_Linux_Setup/arch_setup/dotfiles/swaylock/ ~/.config
_installSymLink wlogout ~/.config/wlogout ~/My_Linux_Setup/arch_setup/dotfiles/wlogout/ ~/.config

_installSymLink scripts ~/.config/scripts ~/My_Linux_Setup/arch_setup/dotfiles/scripts/ ~/.config/scripts
# ------------------------------------------------------
# DONE
# ------------------------------------------------------
echo "DONE! Please reboot your system!"
