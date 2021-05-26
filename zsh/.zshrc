export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git z)
# FZF configuration
source $ZSH/oh-my-zsh.sh
export FZF_DEFAULT_COMMAND='/usr/local/bin/rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# FZF config
export FZF_DEFAULT_COMMAND='${pkgs.ripgrep}/bin/rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

source "/usr/local/opt/fzf/shell/key-bindings.zsh"
source "/usr/local/opt/fzf/shell/completion.zsh"

# User configuration

# -------- programs not found on linux with this line enabled. On OSX it works fine.
export PATH="/usr/local/bin:/usr/bin:/bin:$HOME/.local/bin:/usr/sbin:/sbin:$HOME/mutable_node_modules/bin:$HOME/development/flutter/bin"
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Set nix environment on every start.
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi
export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH

export TERM=xterm-256color 
export GOPATH=$HOME/go
export GOROOT=$(brew --prefix golang)/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

alias v=nvim
alias vim=nvim
alias t="tmux -u"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
