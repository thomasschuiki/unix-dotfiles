# change terminal
sudo apt install rxvt-unicode-256color 
sudo update-alternatives --config x-terminal-emulator


# update xresources
xrdb -merge ~/.Xresources

# fonts and stuff
curl -L -O https://raw.githubusercontent.com/source-foundry/hack-linux-installer/master/hack-linux-installer.sh
chmod +x hack-linux-installer.sh
mkdir -p /home/tom/.local/share/fonts
./hack-linux-installer.sh v3.003

sudo apt install fonts-font-awesome
