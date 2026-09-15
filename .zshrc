# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Update automatically without asking
zstyle ':omz:update' mode auto

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Disable marking untracked files under VCS as dirty
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Update history command date format
HIST_STAMPS="dd/mm/yyyy"

# Plugins
plugins=(
    brew
	git
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load p10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
