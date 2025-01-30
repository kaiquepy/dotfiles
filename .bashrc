# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt Settings
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1

# Defino PS1 prompt
export PS1='\n\[\e[38;5;150;1m\]\w\[\e[0;38;5;157m\]$(__git_ps1 " (%s)")\n\[\e[38;5;221m\]\$\[\e[0m\] '


# Enable Bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Set to superior editing mode
set -o vi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~
if command -v starship &>/dev/null; then
    eval "$(starship init bash)"
fi

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ~~~~~~~~~~~~~~~ Auto Complete ~~~~~~~~~~~~~~~~~~
complete -cf sudo
complete -cf man
complete -cf which

# Improve history
shopt -s histappend
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="ls:exit:pwd:clear:history"
export HISTTIMEFORMAT='%F %T '
export PROMPT_COMMAND='history -a'


shopt -s cdspell
shopt -s dirspell
shopt -s autocd
