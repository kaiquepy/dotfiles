# Colorize the command output
alias ls='echo && ls --color=auto --group-directories-first'
alias ip='ip --color=auto'
alias grep='grep --color=auto'

# cd
alias ..="cd .."

alias path='echo -e ${PATH//:/\\n}'

# Simple copy/past clipboard
alias fromclip='xclip -o -sel copy'
alias toclip='xclip -i -sel copy'
