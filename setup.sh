#!/bin/bash

#DOT_FILES=(.atom .zshrc .vimrc .vim .tmux.conf .pythonrc.py .gitignore .gitconfig .emacs.d)
DOT_FILES=(.zshrc .vimrc .vim .tmux.conf .gitignore .gitconfig)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

cd ~/Library/Application\ Support/Code/User
if [ -e keybindings.json ]; then mv keybindings.json keybindings.json.org; fi
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User
if [ -e settings.json ]; then mv settings.json settings.json.org; fi
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User
if [ -e snippets ]; then mv snippets snippets.org; fi
ln -s ~/dotfiles/vscode/snippets ~/Library/Application\ Support/Code/User
