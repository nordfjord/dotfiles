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
kubectl
EOBUNDLES

antigen theme denysdovhan/spaceship-prompt

antigen apply

export EDITOR='vim'

alias ll="ls -lhF"
alias grbm="git rebase origin/master"
alias export-docker=eval "${docker-machine env dev}"
alias awsl="aws --endpoint-url=http://localhost:4566"

export PATH="$PATH:$HOME/npm/bin"
export PATH="$PATH:./node_modules/.bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:~/.cabal/bin:~/.ghcup/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

SPACESHIP_NODE_DEFAULT_VERSION=$(nvm version default)

alias vi="vim"

export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

vterm_printf(){
    if [ -n "$TMUX" ]; then
        # Tell tmux to pass the escape sequences through
        # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
[ -f "/Users/nordfjord/.ghcup/env" ] && source "/Users/nordfjord/.ghcup/env" # ghcup-env

source ~/.kafkarc
source ~/.kubectl-utils.sh

WATCH_COMMAND='zsh -ci'

# Load k8s auto completion
source <(kubectl completion zsh)
setopt inc_append_history
