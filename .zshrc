# Add fnm load to shell
eval "$(fnm env --use-on-cd --shell zsh)"

# bun completions
[ -s "/Users/soryn/.bun/_bun" ] && source "/Users/soryn/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"

# Aliases
alias n="nvim"
alias nv="nvim"
alias ls="eza --icons=always -a -1"
alias cd="z"

eval "$(starship init zsh)"
