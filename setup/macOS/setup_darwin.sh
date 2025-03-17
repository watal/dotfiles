#!/usr/bin/env bash

set -euo pipefail
CWD=${1:-$(cd "$(dirname "$0")"/../../ && pwd)}

symLinks() {
    echo "Creating symbolic links..."

    # Vim
    ln -sf "$CWD/nvim/init.vim" ~/.vimrc

    # Neovim
    ln -sf "$CWD/nvim/init.vim" ~/.config/nvim/init.vim
    ln -sf "$CWD/nvim/dein.toml" ~/.config/dein/dein.toml
    ln -sf "$CWD/nvim/dein_lazy.toml" ~/.config/dein/dein_lazy.toml

    # Fish
    ln -sf "$CWD/fish/config.fish" ~/.config/fish/config.fish
    ln -sf "$CWD/fish/aliases.fish" ~/.config/fish/aliases.fish
    find "$CWD/fish/conf.d" -type f -exec ln -sf {} ~/.config/fish/conf.d/{} \;
    find "$CWD/fish/functions" -type f -exec ln -sf {} ~/.config/fish/functions/{} \;

    # Tmux
    ln -sf "$CWD/tmux/tmux.conf" ~/.tmux.conf
    ln -sf "$CWD/tmux/tmuxline.conf" ~/.tmux/tmuxline.conf

    # Peco
    ln -sf "$CWD/peco/config.json" ~/.config/peco/config.json

    # GRC
    ln -sf "$CWD/grc/conf.mtr" ~/.grc/conf.mtr

    # Latexmk
    ln -sf "$CWD/latexmk/latexmkrc" ~/.latexmkrc

    # Karabiner
    ln -sf "$CWD/karabiner/karabiner.json" ~/.config/karabiner/karabiner.json

    echo "Symbolic links created successfully."
}

symLinks
