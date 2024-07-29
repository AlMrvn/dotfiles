# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Path for the $XDG_CONFIG_HOME for mac and linux to be the same
if [[ -z "$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME="$HOME/.config/"
fi



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
