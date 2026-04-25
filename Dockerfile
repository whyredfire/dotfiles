FROM alpine:latest AS builder
RUN apk add --no-cache git build-base neovim curl zsh bash tmux

WORKDIR /root
ARG ZSH_CUSTOM=/root/.oh-my-zsh/custom

# Install Oh My Zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Clone Plugins & Themes
RUN git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM}/plugins/zsh-autosuggestions && \
    git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting && \
    git clone --depth 1 https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM}/plugins/zsh-completions && \
    git clone --depth 1 https://github.com/tmux-plugins/tpm.git /root/.tmux/plugins/tpm && \
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM}/themes/powerlevel10k

# Setup Tmux plugins in builder stage
COPY .config/tmux /root/.config/tmux
RUN /root/.tmux/plugins/tpm/bin/install_plugins

# Setup Neovim plugins in builder stage
COPY .config/nvim /root/.config/nvim
RUN nvim --headless "+Lazy! sync" +qa && \
    nvim --headless "+Lazy load nvim-treesitter" "+TSInstallSync! lua c javascript python bash" +qa

# Final Image
FROM alpine:latest
RUN apk add --no-cache \
    ca-certificates \
    curl \
    git \
    neovim \
    tmux \
    zsh \
    bat \
    fastfetch \
    bash

# Set default shell to zsh for root
RUN sed -i -e "s|root:/root:.*|root:/root:/bin/zsh|" /etc/passwd
ENV SHELL=/bin/zsh

WORKDIR /root

# Copy Oh My Zsh and plugins from builder
COPY --from=builder /root/.oh-my-zsh /root/.oh-my-zsh
COPY --from=builder /root/.tmux /root/.tmux

# Copy local dotfiles
COPY .zshrc .gitconfig .p10k.zsh* ./
COPY .config/ .config/

# Copy built plugins (Neovim and Tmux) from builder
COPY --from=builder /root/.local/share/nvim /root/.local/share/nvim
COPY --from=builder /root/.config/tmux/plugins /root/.config/tmux/plugins

CMD [ "zsh" ]
