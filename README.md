# Welcome to kickstart.dev 👋

This repository contains the configuration for all the tools I use.

## Requirements

Ensure you have the following installed on your system:

- [neovim](https://github.com/neovim/neovim) - A hyperextensible Vim-based text editor.
- [tmux](https://github.com/tmux/tmux) - A terminal multiplexer.
- [zsh](https://www.zsh.org/) - A powerful shell.
  - [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) - A delightful framework for managing your zsh configuration.
- [GNU Stow](https://www.gnu.org/software/stow/) - A symlink manager.
- [A Nerd Font of your choice](https://github.com/ryanoasis/nerd-fonts) - Iconic font pack.

> The requirements are only necessary if you want to copy the configuration. They do not install the packages.

## Installation

First, clone the repository:

```bash
$ git clone https://github.com/Flokkq/kickstart.dev
$ cd kickstart.dev
```

Then use GNU Stow to create symlinks in the parent directory:

```bash
$ stow --adopt .
```

> The `--adopt` flag tells `stow` to adopt the existing files in the destination directory as part of the new package.

Note that many scripts in the [scripts](scripts/) directory are for personal use and may not work properly for others.
