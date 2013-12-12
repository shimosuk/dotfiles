#!/bin/sh
mkdir $HOME/oldot
mv $HOME/.gitconfig $HOME/oldot/dot.gitconfig
mv $HOME/.gitignore $HOME/oldot/dot.gitignore
mv $HOME/.gitmessage.txt $HOME/oldot/dot.gitmessage.txt
mv $HOME/.vimrc $HOME/oldot/dot.vimrc
mv $HOME/.zshrc $HOME/oldot/dot.zshrc
mv $HOME/.vim $HOME/oldot/dot.vim
ln -sf $HOME/dotfiles/dot.gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/dot.gitignore $HOME/.gitignore
ln -sf $HOME/dotfiles/dot.gitmessage.txt $HOME/.gitmessage.txt
ln -sf $HOME/dotfiles/dot.vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/dot.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/dot.vim $HOME/.vim
git submodule init
git submodule update
