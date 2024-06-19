# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh ]; then
    . /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
fi

export ZSH="$HOME/.oh-my-zsh"
export GOPATH=$HOME/go
export SHELL=$(which zsh)

ICLOUD_DIR="/Users/clemensweber/Library/Mobile Documents/com~apple~CloudDocs"
ZSHRC_DIR="$HOME/kickstart.dev/"

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
plugins=(
  git
  zsh-autosuggestions
  F-Sy-H
)

DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_THEME="norm" # set by `omz`

source $ZSH/oh-my-zsh.sh

# alias movement
alias cls="clear"
alias ..="cd .."
alias ...="cd../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias /="cd /"

# alias ls
alias lsn="eza"
alias ls="eza -lah"
alias ll="eza -lh"
alias la="eza -A"

# alias git
alias git="LC_ALL=en_US git"
alias gs="git status"
alias ga="git add"
alias grm="git rm"
alias grmrf="git rm -rf" 
alias gc="git commit"
alias gp="git push"
alias gl="git pull"
alias ghist="git log --color --pretty=format:\"%C(yellow)%h%C(reset) %s%C(bold red)%d%C(reset) %C(green)%ad%C(reset) %C(blue)[%an]%C(reset)\" --relative-date --decorate"
alias gb="git blame --color-lines"
alias gd="git diff"

# alias os
alias updateos="softwareupdate -i -a"

# alias custom
alias psql-docker='psql -h localhost -p 5432 -U postgres -d postgres'
alias speedtest="curl -o /dev/null cachefly.cachefly.net/250mb.test"
alias air="~/bin/air"
alias at="echo @ | pbcopy"

# alias zsh
alias editzsh="nvim $ZSHRC_DIR/.zshrc"
alias reloadzsh="source $ZSHRC_DIR/.zshrc"

# p10k
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯❯❯'

# ssh connections
source $ZSHRC_DIR/.ssh_aliases

# scripts
source $ZSHRC_DIR/scripts/cloc-git.sh
source $ZSHRC_DIR/scripts/extract.sh
source $ZSHRC_DIR/scripts/lg.sh
source $ZSHRC_DIR/scripts/air.sh

eval "$(zoxide init --cmd cd zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
