#!/bin/bash

DOT_FILES=(.zshrc .vimrc .vim .tmux.conf .pythonrc.py .gitconfig .gitignore)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

