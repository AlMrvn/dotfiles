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
