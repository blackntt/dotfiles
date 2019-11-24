#!/bin/bash
echo 'source $HOME/dotfiles/.bashrc' >> $HOME/.bashrc

#install neovim
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
mkdir -p $HOME/apps
mv nvim.appimage $HOME/apps

#create symbolic vim to neovim
sudo apt remove vim
cd $HOME/apps
ln -sf nvim.appimage nvim
ln -sf nvim.appimage vim
echo 'export PATH=$HOME/apps:$PATH' >> $HOME/.bashrc

#create file config for neovim
cd $HOME/.config
ln -sf $HOME/dotfiles/.vim nvim
cd $HOME/.config/nvim
ln -sf $HOME/dotfiles/.vimrc init.vim

#create symbolic link to tmux.conf
cd $HOME
ln -sf $HOME/dotfiles/.tmux.conf .tmux.conf
