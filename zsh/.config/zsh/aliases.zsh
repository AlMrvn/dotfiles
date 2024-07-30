# --- Git aliases ---
alias g=git

# alias navigation
alias :q=exit
alias ..='cd ..'
alias ....='cd ../..'
alias zshrc='${=EDITOR} ${ZDOTDIR:-$HOME}/.zshrc' # Quick access to the .zshrc file
alias dotfiles="cd ~/.dotfiles"

# fun stuff
# # Search through your command history and print the top 10 commands
alias history-stat='history 0 | awk "{print $2}" | sort | uniq -c | sort -n -r | head'
