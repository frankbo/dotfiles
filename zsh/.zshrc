export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

# zsh-kubectl-prompt needs to be cloned before see: https://github.com/superbrothers/zsh-kubectl-prompt#with-a-plugin-manager
plugins=(git z vi-mode zsh-kubectl-prompt)
source $ZSH/oh-my-zsh.sh

# FZF configuration
export FZF_DEFAULT_COMMAND='/opt/homebrew/bin/rg --files --no-ignore --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
# User configuration

# -------- programs not found on linux with this line enabled. On OSX it works fine.
export PATH="$PATH:/opt/homebrew/bin:/usr/bin:/bin:$HOME/.local/bin:/usr/sbin:/sbin:/usr/local/bin"

## NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
## End NVM
export JAVA_HOME="/opt/homebrew/Cellar/openjdk/20.0.1"

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# End Android

# Flutter
export PATH=$PATH:$HOME/development/flutter/bin
# End Flutter

# Docker
export PATH=$PATH:$HOME/.docker/bin
# End Docker

# VSCode
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# End VSCode

export TERM=xterm-256color 
export GOPATH=$HOME/go
export GOROOT=$(brew --prefix golang)/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

alias v=nvim
alias vim=nvim
alias t="tmux -u"
alias k=kubectl

# Autocompletion for kubectl alias
complete -F __start_kubectl k

eval "$(direnv hook zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# define prompt for kubectl-prompt
RPROMPT='%{$fg[cyan]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

# needs to be at the very end. Otherwise it won't work
source <(kubectl completion zsh)

# Set nix environment on every start.
# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

