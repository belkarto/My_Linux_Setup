#/bin/bash

# ------------------------------------------------------
# colors
# ------------------------------------------------------
RED="\033[31m"
GREEN="\033[32m"
END="\033[0m"

# ------------------------------------------------------
# Check if yay is installed
# ------------------------------------------------------
echo -e ${GREEN}"#################################################################"
echo "#	██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗	#"   
echo "#	██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║	#" 
echo "#	██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║	#"
echo "#	██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║	#"
echo "#	██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗	#"
echo "#	╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚══════╝	#"
echo "#################################################################"
echo -e ${END}
sleep 1
clear
if sudo pacman -Qs yay > /dev/null ; then
	echo "yay is installed. You can proceed with the installation"
else
	echo "yay is not installed. Will be installed now!"
    sudo pacman -S base-devel
	git clone https://aur.archlinux.org/yay-git.git ~/bin/yay-git
	cd ~/bin/yay-git/
	makepkg -si
	rm -rf ~/bin/yay-git
	cd ~/dotfiles/
	clear
	echo -s "${GREEN}yay has been installed successfully.${END}"
	echo ""
fi
# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------

while true; do
	read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " answer
	case $answer in
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
	#standalone compositor
	"picom" 
	#terminal
	"alacritty"
	#application launcher
	"rofi" 
	"rofi-calc" 
	#command line screen capture utility
	"scrot"
	#desktop background browser
	"nitrogen"
	#notification
	"dunst" 
	#shell promt
	"starship"
	#display locker
	"slock" 
	#file manager
	"thunar" 
	# terminal ascii art
	"figlet" 
	#theme switcher LXDE + feature rich GTK
	"lxappearance" 
	#pulseaudio manager
	"pavucontrol" 
	#display manager | login screen manager
	"ly"
    "exa"
    "mousepad"
	"breeze" 
	"breeze-gtk" 
	"vlc" 
	"neovim" 
	"mpv" 
	"hyprland" 
	"xdg-desktop-portal-hyprland" 
	"waybar" 
	"grim" 
	"slurp"
	"xfce4-power-manager" 
	"python-pip" 
	"python-psutil" 
	"python-rich" 
	"python-click" 
	"xdg-desktop-portal-gtk"
	"tumbler" 
	"xautolock" 
	"blueman"
	"chromium" 
	"firefox"
	"ttf-font-awesome" 
	"ttf-fira-sans" 
	"ttf-fira-code" 
	"ttf-firacode-nerd"
    "freerdp"
	);

	packagesYay=(
		"brave-bin" 
		"pfetch" 
		"bibata-cursor-theme" 
		"trizen"
		"swww" 
		"swaylock-effects" 
		"wlogout"
		"ttf-meslo-nerd-font-powerlevel10k"
		);

# ------------------------------------------------------
# Install required packages
# ------------------------------------------------------
source /home/belkarto/My_Linux_Setup/arch_setup/dotfiles/scripts/library.sh
_installPackagesPacman "${packagesPacman[@]}";
_installPackagesYay "${packagesYay[@]}";

# ------------------------------------------------------
# Install display manager
# ------------------------------------------------------
while true; do
	read -p "DO YOU WANT ENABLE LY? (Yy/Nn): " answer
	case $answer in
		[Yy]* )
			echo "Installation started."
            sudo systemctl enable ly.service
			break;;
		[Nn]* ) 
			exit;
			break;;
		* ) echo "Please answer yes or no.";;
	esac
done

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
# echo ""
# echo "-> Install .bashrc"

# _installSymLink .bashrc ~/.bashrc ~/dotfiles/.bashrc ~/.bashrc

# ------------------------------------------------------
# Init pywal
# ------------------------------------------------------
 # echo ""
 # echo "-> Init pywal"
 # wal -i ~/dotfiles/default.jpg
 # echo "pywal initiated."

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
#clear
echo -e "${GREEN} DONE! ${END}"
