# lang
export LANG=ja_JP.UTF-8

# prompt
autoload colors
colors
PROMPT="%{${fg[blue]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# Completion configuration
autoload -U compinit
compinit

# Completion match Uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# alias
alias l='ls'
alias ll='ls -ahl'

# python
export PYTHONSTARTUP=$HOME/.pythonrc.py

# pythonbrew
[ -f $HOME/.pythonbrew/etc/bashrc ] && source $HOME/.pythonbrew/etc/bashrc

# rbenv
eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/shims:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

case "${OSTYPE}" in
# Mac
darwin*)
  [ -f ~/dotfiles/.zshrc.osx ] && source ~/dotfiles/.zshrc.osx
  ;;
# Linux
linux*)
  [ -f ~/dotfiles/.zshrc.linux ] && source ~/dotfiles/.zshrc.linux
  ;;
esac

