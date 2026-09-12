#!/bin/bash

# Install the tmux, Lazygit, Ghostty, and AeroSpace configs on macOS.

set -euo pipefail

DOTFILES_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
APP_SUPPORT="$HOME/Library/Application Support"

if [ "$(uname -s)" != "Darwin" ]; then
    echo "This installer is for macOS (AeroSpace and Ghostty macOS settings)." >&2
    exit 1
fi

# Preserve existing configs, including symlinks, without overwriting old backups.
link_config() {
    local src="$DOTFILES_DIR/$1"
    local dest="$2"
    local backup="$dest.backup"
    local index=1

    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        echo "Already linked: $dest"
        return
    fi

    mkdir -p "$(dirname "$dest")"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        while [ -e "$backup" ] || [ -L "$backup" ]; do
            backup="$dest.backup.$index"
            index=$((index + 1))
        done
        echo "Backing up: $dest -> $backup"
        mv "$dest" "$backup"
    fi

    echo "Linking: $dest -> $src"
    ln -s "$src" "$dest"
}

link_config "tmux" "$CONFIG_DIR/tmux"
link_config "tmux/tmux.conf" "$HOME/.tmux.conf"
link_config "lazygit" "$CONFIG_DIR/lazygit"
link_config "lazygit/config.yml" "$APP_SUPPORT/lazygit/config.yml"
link_config "ghostty" "$CONFIG_DIR/ghostty"
link_config "ghostty/macos.conf" "$APP_SUPPORT/com.mitchellh.ghostty/config"
link_config "aerospace/aerospace.toml" "$HOME/.aerospace.toml"

TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    mkdir -p "$(dirname "$TPM_DIR")"
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "TPM already installed."
fi

cat <<EOF

Installation complete!

1. Open or restart Ghostty.
2. Start tmux and press Ctrl+Space, then Shift+I to install tmux plugins.
   For an existing tmux server: tmux source-file ~/.tmux.conf
3. Open AeroSpace and grant Accessibility access when prompted.
   If it is already running: aerospace reload-config
4. Launch lazygit from a Git repository.

Keymaps: $DOTFILES_DIR/KEYMAPS.md
EOF
