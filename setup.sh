#!/bin/bash

#DOT_FILES=(.atom .zshrc .vimrc .vim .tmux.conf .pythonrc.py .gitignore .gitconfig .emacs.d)
DOT_FILES=(.zshrc .vimrc .vim .tmux.conf .gitignore .gitconfig)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

cd ~/.atom
mv styles.less styles.org.less
ln -s ~/dotfiles/.atom/styles.less ~/.atom
mv config.cson config.org.cson
ln -s ~/dotfiles/.atom/config.cson ~/.atom
mv keymap.cson keymap.org.cson
ln -s ~/dotfiles/.atom/keymap.cson ~/.atom
mv init.coffee init.org.coffee
ln -s ~/dotfiles/.atom/init.coffee ~/.atom
mv snippets.cson snippets.org.cson
ln -s ~/dotfiles/.atom/snippets.cson ~/.atom

cd ~/Library/Application\ Support/Code/User
mv keybindings.json keybindings.json.org
ln -s ~/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User
mv settings.json settings.json.org
ln -s ~/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User
