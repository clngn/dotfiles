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
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# 改行のない行を出力する
unsetopt promptcr

# Completion configuration
autoload -U compinit
compinit

# Completion match Uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# zsh incremental completion
#[ -d $HOME/dotfiles/.zsh/plugin ] && source $HOME/dotfiles/.zsh/plugin/incr*.zsh

# alias
alias l='ls'
alias ll='ls -ahl'
alias grep='grep --color'

# python
export PYTHONSTARTUP=$HOME/.pythonrc.py

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
[ -d $PYENV_ROOT ] && eval "$(pyenv init -)"

# rbenv
[ -f $HOME/.rbenv/shims ] && eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/shims:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# julius
export PATH=$HOME/work/julius/build/bin:$PATH

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

case "${OSTYPE}" in
# Mac
darwin*)
  [ -f $HOME/dotfiles/.zshrc.osx ] && source $HOME/dotfiles/.zshrc.osx
  ;;
# Linux
linux*)
  [ -f $HOME/dotfiles/.zshrc.linux ] && source $HOME/dotfiles/.zshrc.linux
  ;;
esac

