#!/bin/bash

DOT_FILES=(.zshrc .vimrc .vim .tmux.conf .pythonrc.py .gitignore .gitconfig .emacs.d)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
