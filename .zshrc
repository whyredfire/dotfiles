# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# oh-my-zsh theme
ZSH_THEME="robbyrussell"

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# disable marking untracked files under VCS as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# enable timestamps in history
HIST_STAMPS="mm/dd/yyyy"

# plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# aliases
alias c='clear'

# launch tmux on init
if [ -n "$PS1" ] && [ -z "$TMUX" ]; then
    tmux attach -t main || tmux new -s main
fi
