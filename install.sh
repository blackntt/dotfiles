#!/bin/bash
echo 'source $HOME/dotfiles/.bashrc' >> $HOME/.bashrc

#install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
#install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#install silver search ga
sudo apt-get install silversearcher-ag
#create file config for neovim
cd $HOME/.config
ln -sf $HOME/dotfiles/.vim nvim
cd $HOME/.config/nvim
ln -sf $HOME/dotfiles/.vimrc init.vim

#create symbolic link to tmux.conf
cd $HOME
ln -sf $HOME/dotfiles/.tmux.conf .tmux.conf
