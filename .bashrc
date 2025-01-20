# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Prompt Settings
PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'; PS1='\[\e[38;5;148;1m\]\w\[\e[0;38;5;157m\]${PS1_CMD1}\n\[\e[38;5;220m\]\$\[\e[0m\] '
source "$HOME/.git-prompt.sh"

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
