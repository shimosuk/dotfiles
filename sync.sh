#!/bin/sh
mkdir $HOME/oldot
mkdir $HOME/.vim/ftplugin
mv $HOME/.gitconfig $HOME/oldot/dot.gitconfig
mv $HOME/.gitignore $HOME/oldot/dot.gitignore
mv $HOME/.gitmessage.txt $HOME/oldot/dot.gitmessage.txt
mv $HOME/.vimrc $HOME/oldot/dot.vimrc
mv $HOME/.zshrc $HOME/oldot/dot.zshrc
ln -s $HOME/dotfiles/dot.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/dot.gitignore $HOME/.gitignore
ln -s $HOME/dotfiles/dot.gitmessage.txt $HOME/.gitmessage.txt
ln -s $HOME/dotfiles/dot.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/dot.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/dot.vim/filetype.vim $HOME/.vim/                                                                                                                                    [~]
ln -s $HOME/dotfiles/dot.vim/ftplugin/* $HOME/.vim/ftplugin/
