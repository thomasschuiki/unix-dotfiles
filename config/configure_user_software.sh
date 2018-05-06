#configure user software
# install neovim package manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# create config directory
mkdir -p ~/.config/nvim
cat << EOF > ~/.config/nvim/init.vim

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()
EOF

echo 'Run :PlugInstall from vim'
