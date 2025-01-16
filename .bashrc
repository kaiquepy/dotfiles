# Set to superior editing mode
set -o vi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~~
eval "$(starship init bash)"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# ~~~~~~~~~~~~~~~ Auto Complete ~~~~~~~~~~~~~~~~~~
complete -cf sudo
complete -cf man
complete -cf which
