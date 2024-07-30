# --- Git aliases ---
alias g=git

# alias navigation
alias :q=exit
alias ..='cd ..'
alias ....='cd ../..'

# fun stuff
# # Search through your command history and print the top 10 commands
alias history-stat='history 0 | awk "{print $2}" | sort | uniq -c | sort -n -r | head'
