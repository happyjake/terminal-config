#!/bin/bash

# Modern Terminal Config Installation Script
# https://github.com/happyjake/terminal-config

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Header
echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Modern Terminal Config Installer   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS only"
    exit 1
fi

# Check for Homebrew
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon Macs
    if [[ -f "/opt/homebrew/bin/brew" ]]; then
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
else
    print_success "Homebrew is installed"
fi

# Install Starship
if ! command -v starship &> /dev/null; then
    print_info "Installing Starship prompt..."
    brew install starship
    print_success "Starship installed"
else
    print_success "Starship is already installed"
fi

# Install Fastfetch
if ! command -v fastfetch &> /dev/null; then
    print_info "Installing Fastfetch..."
    brew install fastfetch
    print_success "Fastfetch installed"
else
    print_success "Fastfetch is already installed"
fi

# Optional: Install JetBrains Mono font
read -p "Do you want to install JetBrains Mono Nerd Font? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    print_info "Installing JetBrains Mono Nerd Font..."
    brew tap homebrew/cask-fonts 2>/dev/null || true
    brew install --cask font-jetbrains-mono-nerd-font
    print_success "Font installed"
fi

# Backup existing configs
print_info "Backing up existing configurations..."
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
[ -f ~/.config/starship.toml ] && cp ~/.config/starship.toml ~/.config/starship.toml.backup.$(date +%Y%m%d_%H%M%S)
[ -f ~/.config/fastfetch/config.jsonc ] && cp ~/.config/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc.backup.$(date +%Y%m%d_%H%M%S)
print_success "Backups created"

# Download configurations
print_info "Downloading configuration files..."
REPO_URL="https://raw.githubusercontent.com/happyjake/terminal-config/main"

# Download .zshrc
curl -sSL "$REPO_URL/.zshrc" -o /tmp/terminal-config-zshrc
if [ -f ~/.zshrc ]; then
    print_info "Merging with existing .zshrc..."
    echo "" >> ~/.zshrc
    echo "# === Modern Terminal Config Start ===" >> ~/.zshrc
    cat /tmp/terminal-config-zshrc >> ~/.zshrc
    echo "# === Modern Terminal Config End ===" >> ~/.zshrc
else
    cp /tmp/terminal-config-zshrc ~/.zshrc
fi

# Download Starship config
mkdir -p ~/.config
curl -sSL "$REPO_URL/starship.toml" -o ~/.config/starship.toml

# Download Fastfetch config
mkdir -p ~/.config/fastfetch
curl -sSL "$REPO_URL/fastfetch/config.jsonc" -o ~/.config/fastfetch/config.jsonc

print_success "Configuration files installed"

# Final instructions
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║      Installation Complete! 🎉         ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
print_info "To apply changes, run:"
echo -e "  ${YELLOW}source ~/.zshrc${NC}"
echo ""
print_info "To customize:"
echo -e "  Starship: ${YELLOW}~/.config/starship.toml${NC}"
echo -e "  Fastfetch: ${YELLOW}~/.config/fastfetch/config.jsonc${NC}"
echo ""
print_info "For more information, visit:"
echo -e "  ${BLUE}https://github.com/happyjake/terminal-config${NC}"
echo ""