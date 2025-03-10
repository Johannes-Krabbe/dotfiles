if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    F-Sy-H
)

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

eval "$(zoxide init zsh)"

alias n="~/.config/nvim/nvim-launcher.sh"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

# flutter
export PATH=$HOME/dev/flutter/bin:$PATH

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# . "/Users/johanneskrabbe/.deno/env"


export PATH="$HOME/.config/scripts:$PATH"
alias bs='branchstatus.sh'
alias cd="echo 'Use zoxide instead: '"
