# lang
export LANG=ja_JP.UTF-8

# prompt
autoload colors
colors
PROMPT="%{${fg[cyan]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[cyan]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"

# color
export CLICOLOR=1
export LSCOLORS="gxfxcxdxbxegedabagacad"

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# Completion configuration
autoload -U compinit
compinit

# alias
alias l='ls'
alias ll='ls -ahl'
alias o='open .'
alias safari='open -a Safari'
alias chrome='open -a Google\ Chrome'
alias emacs='open -a Emacs'
alias emacsnw='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
alias cot='open -a CotEditor'

# Android SDK
export PATH=$PATH:~/work/android-sdk-mac_x86/tools

# virtualenv
export WORKON_HOME=$HOME/work/.virtualenvs
source `which virtualenvwrapper.sh`

# python
#alias python='python2.7'
export PYTHONSTARTUP=$HOME/.pythonrc.py

