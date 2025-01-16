# Set to superior editing mode
set -o vi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(starship init bash)"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

# cd
alias ..="cd .."

# ip
alias ip='ip -c'

# Simple copy/past clipboard
alias fromclip='xclip -o -sel copy'
alias toclip='xclip -i -sel copy'
