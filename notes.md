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

# init.vim

source $HOME/.config/nvim/config/init.vimrc #holds my vim-plug section, which initializes all my other plugins.
source $HOME/.config/nvim/config/general.vimrc #holds a bunch of general settings which didn’t fit in the other categories.
source $HOME/.config/nvim/config/plugins.vimrc #holds all my plugin-specific settings.
source $HOME/.config/nvim/config/keys.vimrc #holds all my custom key-bindings.
source $HOME/.config/nvim/config/line.vimrc #holds my statusline configuration.
