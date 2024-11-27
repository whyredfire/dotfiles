FROM ubuntu:latest

# Install dependencies and clean up
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y curl gcc git nano wget neovim zsh zsh-autosuggestions zsh-syntax-highlighting && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /root

# Install oh-my-zsh and plugins
ARG ZSH_PATH=/root/.oh-my-zsh/custom/plugins
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_PATH/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PATH/zsh-syntax-highlighting && \
    git clone https://github.com/zsh-users/zsh-completions.git $ZSH_PATH/zsh-completions && \
    sed -i '/^plugins=(.*)$/s/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)/' ~/.zshrc

# Copy Neovim configuration
RUN git clone https://github.com/whyredfire/dotfiles && \
    mkdir -p ~/.config/nvim && \
    cp -r dotfiles/.config/nvim/* ~/.config/nvim/ && \
    rm -rf dotfiles

# Set git configs
RUN git config --global user.email "karan@pixelos.net" && \
    git config --global user.name "Karan Parashar" && \
    git config --global alias.cp 'cherry-pick' && \
    git config --global alias.c 'commit' && \
    git config --global alias.f 'fetch' && \
    git config --global alias.m 'merge' && \
    git config --global alias.rb 'rebase' && \
    git config --global alias.rs 'reset' && \
    git config --global alias.ck 'checkout' && \
    git config --global core.editor "nvim" && \
    git config --global commit.verbose true

# Set zsh as default shell
CMD [ "zsh" ]
