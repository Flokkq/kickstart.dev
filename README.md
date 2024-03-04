# Welcome to kickstart.dev 👋

This repository contains all my tools that i use for developing!

## Requirements

Ensure you have the following installed on your system

There is also an [installation script](scripts/install.sh) that you can use to install all dependencies (works for most Linux distros aswell)

### Stow

```bash
brew install stow
```

### Neovim

```bash
brew install neovim
```

### iterm2

```bash
brew install --cask iterm2
```

### tmux

```bash
brew install tmux
```

### Nerdfonts

Note that you need to install nerd-fonts regularly from [Github](https://github.com/ryanoasis/nerd-fonts.git)

```bash
git clone --depth 1
git clone --filter=blob:none git@github.com:ryanoasis/nerd-fonts
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ gh repo clone Flokkq/dotfiles
$ cd dotfiles
```

then use GNU stow to create symlinks

```bash
# to overwrite existing configurations
$ stow --adopt .
```

Note that many scripts in [/scritps](scripts/) do not work properly
