#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
BIN_DIR="$HOME/.local/bin"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

confirm() {
    local prompt="$1"
    local response
    echo -en "${YELLOW}[CONFIRM]${NC} $prompt [y/N] "
    read -r response
    [[ "$response" =~ ^[Yy]$ ]]
}

# Create symlink, backing up existing files/directories
create_symlink() {
    local src="$1"
    local dest="$2"

    if [[ -L "$dest" ]]; then
        # Already a symlink
        local current_target
        current_target=$(readlink -f "$dest")
        if [[ "$current_target" == "$src" ]]; then
            info "Already linked: $dest"
            return 0
        else
            if confirm "Replace symlink $dest -> $(readlink "$dest") with $src?"; then
                rm "$dest"
            else
                warn "Skipping: $dest"
                return 0
            fi
        fi
    elif [[ -e "$dest" ]]; then
        # File or directory exists, back it up
        local backup="${dest}.backup.$(date +%Y%m%d%H%M%S)"
        warn "Backing up existing: $dest -> $backup"
        mv "$dest" "$backup"
    fi

    ln -s "$src" "$dest"
    info "Linked: $dest -> $src"
}

# Configs to symlink to ~/.config
CONFIG_APPS=(
    fish
    ghostty
    i3
    kitty
    mako
    nvim
    opencode
    sway
    tmux
    waybar
    zellij
)

main() {
    echo "========================================"
    echo "  Dotfiles Installation Script"
    echo "========================================"
    echo
    echo "Dotfiles directory: $DOTFILES_DIR"
    echo "Config directory:   $CONFIG_DIR"
    echo "Bin directory:      $BIN_DIR"
    echo

    # Ensure config directory exists
    mkdir -p "$CONFIG_DIR"

    # Symlink config directories
    info "Setting up config symlinks..."
    for app in "${CONFIG_APPS[@]}"; do
        if [[ -d "$DOTFILES_DIR/$app" ]]; then
            create_symlink "$DOTFILES_DIR/$app" "$CONFIG_DIR/$app"
        else
            warn "Directory not found: $DOTFILES_DIR/$app"
        fi
    done

    # Symlink bin directory
    if [[ -d "$DOTFILES_DIR/bin" ]]; then
        info "Setting up bin symlink..."
        mkdir -p "$(dirname "$BIN_DIR")"
        create_symlink "$DOTFILES_DIR/bin" "$BIN_DIR"
    fi

    # Symlink systemd user services
    if [[ -d "$DOTFILES_DIR/systemd/user" ]]; then
        info "Setting up systemd user services..."
        mkdir -p "$CONFIG_DIR/systemd"
        create_symlink "$DOTFILES_DIR/systemd/user" "$CONFIG_DIR/systemd/user"
        info "Run 'systemctl --user daemon-reload' to reload systemd user units"
    fi

    # Bootstrap fish shell with fisher
    if command -v fish &> /dev/null; then
        if confirm "Install fisher and fish plugins?"; then
            info "Installing fisher and plugins..."
            fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'
            info "Fisher and plugins installed"
        fi
    else
        warn "Fish shell not found, skipping fisher installation"
    fi

    echo
    echo "========================================"
    echo "  Installation complete!"
    echo "========================================"
    echo
    echo "Notes:"
    echo "  - Backups of existing files have .backup.* suffix"
    echo "  - Ensure ~/.local/bin is in your PATH"
    echo "  - For systemd services: systemctl --user daemon-reload"
    echo
}

main "$@"
