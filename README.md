# dotfiles
dot files for my personal environment.

Following a simple setup using [GNU Stow](https://www.gnu.org/software/stow/)

# Setup:
Install stow:
```
brew install stow
```

## zsh with oh-my-zsh
install oh-my-zsh [install from github of oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#basic-installation):
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

then install a few neat pluggins:
[zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting/tree/master) for syntax highlight when typing:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

[zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) for commands suggestions as you type based on history and completions.
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

## fzf and ripgrep
install [fzf](https://github.com/junegunn/fzf):
```
brew install fzf
```
With the integration in zsh (see the .zshrc and look for the fzf section", this allow to use amazing command like CTRL-T to search quickly through files.

install [ripgrep](https://github.com/BurntSushi/ripgrep):
```
brew install ripgrep
```

## Install tmux
```
brew install tmux
```

and the plugin manager:
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Install Neovim
```
brew install neovim
```
