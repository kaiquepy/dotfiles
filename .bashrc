# Set to superior editing mode
set -o vi

# keybinds
bind -x '"\C-l":clear'

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(starship init bash)"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

# cd
alias ..="cd .."
alias c="clear"

# Simple copy/past clipboard
alias fromclip='xclip -o -sel copy'
alias toclip='xclip -i -sel copy'
