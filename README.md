# Welcome to kickstart.dev 👋

This repository contains the configuration for all the tools I use.

## Requirements

Ensure you have the following installed on your system:

- [neovim](https://github.com/neovim/neovim)
- [tmux](https://github.com/tmux/tmux)
- [zsh](https://www.zsh.org/)
 - [omz](https://github.com/ohmyzsh/ohmyzsh)
- [GNU Stow](https://www.gnu.org/software/stow/)
- [A Nerd Font of your choice](https://github.com/ryanoasis/nerd-fonts)

## Installation

```bash
$ git clone https://github.com/Flokkq/kickstart.dev
$ cd kickstart.dev

# Then use GNU Stow to create symlinks in the parent directory
$ stow --adopt .
```

Note that many scripts in the [scripts](scripts/) directory are for personal use and may not work properly for others.
