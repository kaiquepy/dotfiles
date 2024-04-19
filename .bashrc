# Set to superior editing mode
set -o vi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(starship init bash)"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

# cd
alias ..="cd .."
alias c="clear"

# Simple copy/past clipboard
alias fromclip='xclip -o -sel copy'
alias toclip='xclip -i -sel copy'
