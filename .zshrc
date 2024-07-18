export PATH="/opt/homebrew/opt/curl/bin:$PATH"

# eval oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/custom.toml)"
fi

# zsh users stuff
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

fpath=(~/.zsh/zsh-autocompletions/src $fpath)

# disable substring highlight
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=''
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=''

# keybinds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# alias
alias ls='ls -G'
