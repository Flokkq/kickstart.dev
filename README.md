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
