# Better history
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Add fnm load to shell
eval "$(fnm env --use-on-cd --shell zsh)"

# bun completions
[ -s "/Users/soryn/.bun/_bun" ] && source "/Users/soryn/.bun/_bun"

# Add pokemon script to path
export PATH="/home/soryn/pokemon-go-colorscripts:$PATH"
export PATH="/Users/soryn/pokemon-go-colorscripts:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"

# Aliases
alias n="nvim"
alias nv="nvim"
alias ls="eza --icons=always -a -1"
alias cd="z"

# syntax hightlighting and suggestions
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

eval $(thefuck --alias --enable-experimental-instant-mode)
eval $(thefuck --alias fuck)

eval "$(starship init zsh)"
