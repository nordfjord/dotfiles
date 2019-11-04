if [[ ! -f ~/antigen.zsh ]]; then
  curl -L git.io/antigen > ~/antigen.zsh
fi

source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
git
z
npm
aws
tomsquest/nvm-auto-use.zsh
zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen theme denysdovhan/spaceship-prompt

antigen apply

export EDITOR='vim'

alias ll="ls -lhF"
alias grbm="git rebase origin/master"
alias export-docker=eval "${docker-machine env dev}"

export PATH="$PATH:$HOME/npm/bin"
export PATH="$PATH:./node_modules/.bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:~/.cabal/bin:~/.ghcup/bin"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

SPACESHIP_NODE_DEFAULT_VERSION=$(nvm version default)

alias vi="vim"

export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

klogs () {
  kubectl logs -f deployments/$1-deployment --all-containers=true
}

