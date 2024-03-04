# Welcome to my dotfiles 👋

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

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

Note that you have to install all plugins in `.config/tmux/plugins` need to be installed manually

```bash
brew install tmux
```

### Nerdfonts

Note that you need to install nerd-fonts regularly [here](https://github.com/ryanoasis/nerd-fonts.git)

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
