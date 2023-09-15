#/bin/bash

# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
if sudo pacman -Qs yay > /dev/null ; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    git clone https://aur.archlinux.org/yay-git.git ~/bin/yay-git
    cd ~/yay-git
    makepkg -si
	rm -rf ~/bin/yay-git
    cd ~/dotfiles/
    clear
    echo "yay has been installed successfully."
    echo ""
    echo "  ___           _        _ _  "
    echo " |_ _|_ __  ___| |_ __ _| | | "
    echo "  | ||  _ \/ __| __/ _  | | | "
    echo "  | || | | \__ \ || (_| | | | "
    echo " |___|_| |_|___/\__\__,_|_|_| "
    echo "                              "
    echo "-------------------------------------"
    echo ""
fi

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
# Install required packages
# ------------------------------------------------------

echo ""
echo "-> Install main packages"

packagesPacman=(
    "picom" 
    "alacritty" 
    "rofi" 
    "rofi-calc" 
    "scrot" 
    "nitrogen" 
    "dunst" 
    "starship"
    "slock" 
    "neovim" 
    "mpv" 
    "xfce4-power-manager" 
    "thunar" 
    "mousepad" 
    "ttf-font-awesome" 
    "ttf-fira-sans" 
    "ttf-fira-code" 
    "ttf-firacode-nerd" 
    "figlet" 
    "lxappearance" 
    "breeze" 
    "breeze-gtk" 
    "vlc" 
    "exa" 
    "python-pip" 
    "python-psutil" 
    "python-rich" 
    "python-click" 
    "xdg-desktop-portal-gtk"
    "pavucontrol" 
    "tumbler" 
    "xautolock" 
    "blueman"
	"freerdp" 
	"chromium" 
	"firefox"
	"ly"
);

packagesYay=(
    "brave-bin" 
    "pfetch" 
    "bibata-cursor-theme" 
    "trizen"
);
  
# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";

# ------------------------------------------------------
# Install pywal
# ------------------------------------------------------
if [ -f /usr/bin/wal ]; then
    echo "pywal already installed."
else
    yay --noconfirm -S pywal
fi

clear

# ------------------------------------------------------
# Install .bashrc
# ------------------------------------------------------
echo ""
echo "-> Install .bashrc"

_installSymLink .bashrc ~/.bashrc ~/dotfiles/.bashrc ~/.bashrc

# ------------------------------------------------------
# Init pywal
# ------------------------------------------------------
echo ""
echo "-> Init pywal"
wal -i ~/dotfiles/default.jpg
echo "pywal initiated."

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
clear
echo "DONE!"
