#configure user software
# install neovim package manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create config directory
mkdir -p ~/.config/nvim
echo 'Link Config Files and then'
echo 'Run :PlugInstall from vim'
