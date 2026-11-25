if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# History
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history hist_expire_dups_first hist_ignore_dups hist_ignore_space hist_verify share_history

# Navigation + completion
setopt auto_cd auto_pushd pushd_ignore_dups interactive_comments
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
alias ls='ls -G'

# Theme (powerlevel10k) + plugins (autosuggestions, F-Sy-H), installed by Nix
[[ -r /etc/zsh-plugins.zsh ]] && source /etc/zsh-plugins.zsh

eval "$(zoxide init zsh)"

alias n="~/.config/nvim/nvim-launcher.sh"

export EDITOR="/bin/zsh $HOME/.config/nvim/nvim-launcher.sh"
export VISUAL="$EDITOR"

# mise: node/python/etc. versions (replaces nvm)
eval "$(mise activate zsh)"

# flutter
export PATH=$HOME/dev/flutter/bin:$PATH

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.config/scripts:$PATH"
alias bs='branchstatus.sh'
alias nt='$HOME/.config/scripts/tmux/start-neotaste-monorepo.sh'
# alias cd="echo 'Use zoxide instead: '"

# bun completions
[ -s "/Users/johanneskrabbe/.bun/_bun" ] && source "/Users/johanneskrabbe/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

bindkey -v
export KEYTIMEOUT=1

# Up/down arrows search history for what's already typed
autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
for km in viins vicmd; do
  bindkey -M $km '^[[A' up-line-or-beginning-search '^[OA' up-line-or-beginning-search
  bindkey -M $km '^[[B' down-line-or-beginning-search '^[OB' down-line-or-beginning-search
done

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q' # Block cursor (Normal mode)
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} == '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[6 q' # Beam cursor (Insert mode)
  fi
}
zle -N zle-keymap-select

# Ensure beam cursor when starting a new line
function zle-line-init {
    zle-keymap-select 'beam'
}
zle -N zle-line-init

# Fix for cursor not resetting after running a command
precmd() { 
    echo -ne '\e[6 q' 
}
export PATH="$HOME/.local/bin:$PATH"

git() {
    if [[ "$1" == "checkout" && "$2" != "--" ]]; then
      echo "Use 'git switch' (branches) or 'git restore' (files) instead."
      return 1
    fi
    command git "$@"
  }

# opencode
export PATH=/Users/johanneskrabbe/.opencode/bin:$PATH

# Use the CLI profile without desktop app integrations.
alias codex='codex --profile cli'
