#!/bin/bash

# ==================================================================
# Install AdwaitaMono Nerd Fonts
# URL: https://github.com/e33io/adwaita-mono-nf/blob/main/install.sh
# ==================================================================

if [ ! -f "/usr/bin/git" ]; then
    echo "#########################################################"
    echo "This script requires git. Install git and try again."
    echo "#########################################################"
    exit 1
fi

echo "#########################################################"
echo "Clone font files and make truetype directory"
echo "#########################################################"

git clone https://github.com/e33io/adwaita-mono-nf $HOME/temp-fonts
sudo mkdir -p /usr/share/fonts/truetype

echo "#########################################################"
echo "Copy font files to the truetype directory"
echo "#########################################################"

if ! { [ -d "/usr/share/fonts/adwaita-mono-fonts" ] || [ -d "/usr/share/fonts/Adwaita" ]; }; then
    sudo cp -R $HOME/temp-fonts/AdwaitaMono/ /usr/share/fonts/truetype
fi
sudo cp -R $HOME/temp-fonts/AdwaitaMono-Nerd/ /usr/share/fonts/truetype
sudo cp -R $HOME/temp-fonts/AdwaitaMono-Nerd-Mono/ /usr/share/fonts/truetype
sudo cp -R $HOME/temp-fonts/AdwaitaMono-Nerd-Propo/ /usr/share/fonts/truetype

echo "#########################################################"
echo "Clean up temp files and cache fonts"
echo "#########################################################"

rm -rf $HOME/temp-fonts
fc-cache -f

echo "#########################################################"
echo "AdwaitaMono Nerd Fonts are now installed"
echo "#########################################################"
