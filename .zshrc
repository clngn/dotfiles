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
alias diff='diff -u'

# python
export PYTHONSTARTUP=$HOME/.pythonrc.py

# pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
[ -d $PYENV_ROOT ] && eval "$(pyenv init -)"

# rbenv
[ -f $HOME/.rbenv/shims ] && eval "$(rbenv init -)"
export PATH=$HOME/.rbenv/shims:$PATH

# scala
export SCALA_HOME=/usr/local/share/scala
export PATH=$SCALA_HOME/bin:$PATH

# rust
export PATH=$HOME/.cargo/bin:$PATH

# julius
export PATH=$HOME/work/julius/build/bin:$PATH

# Heroku Toolbelt
export PATH=/usr/local/heroku/bin:$PATH

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

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

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

