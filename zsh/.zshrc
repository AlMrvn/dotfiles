# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# plugins to install with zsh
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    ripgrep
    )

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# source the oh-my-zsh
source $ZSH/oh-my-zsh.sh
