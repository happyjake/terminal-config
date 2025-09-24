# 🚀 Modern Terminal Config for macOS

A blazingly fast, beautiful terminal setup featuring Ghostty, Starship prompt, and Fastfetch system info.

![Terminal Setup](https://img.shields.io/badge/Terminal-Ghostty-blue)
![Prompt](https://img.shields.io/badge/Prompt-Starship-purple)
![System%20Info](https://img.shields.io/badge/Info-Fastfetch-green)

## ✨ Features

- **Neovim + LazyVim** - Modern IDE-like text editor with full LSP support
- **Ghostty Terminal** - GPU-accelerated, modern terminal emulator
- **Starship Prompt** - Fast, customizable, and intelligent prompt written in Rust
- **Fastfetch** - Lightning-fast system info display with Apple logo
- **Optimized Performance** - Instant shell startup with no lag
- **Beautiful Themes** - TokyoNight Storm color scheme
- **Smart Context** - Shows git info, Node/Python versions only when relevant
- **Z Directory Jumping** - Quick navigation to frequently used directories

## 📦 Prerequisites

- macOS (tested on Sequoia 15.6.1)
- [Homebrew](https://brew.sh) package manager
- [Ghostty](https://ghostty.org) terminal (optional but recommended)
- Zsh shell (default on modern macOS)

## 🛠️ Installation

### Quick Install (One-liner)

```bash
curl -sSL https://raw.githubusercontent.com/happyjake/terminal-config/main/install.sh | bash
```

### Manual Installation

1. **Install required tools:**

```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Starship prompt
brew install starship

# Install Fastfetch for system info
brew install fastfetch

# Install Neovim with dependencies
brew install neovim ripgrep fd lazygit node

# Install Z for directory jumping
brew install z

# Install fonts for better display
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono
brew install --cask font-symbols-only-nerd-font
```

2. **Clone this repository:**

```bash
git clone https://github.com/happyjake/terminal-config.git
cd terminal-config
```

3. **Backup existing configs:**

```bash
# Backup existing files if they exist
[ -f ~/.zshrc ] && cp ~/.zshrc ~/.zshrc.backup
[ -f ~/.config/starship.toml ] && cp ~/.config/starship.toml ~/.config/starship.toml.backup
```

4. **Install configurations:**

```bash
# Copy zsh config
cp .zshrc ~/

# Copy Starship config
mkdir -p ~/.config
cp starship.toml ~/.config/

# Copy Fastfetch config
mkdir -p ~/.config/fastfetch
cp fastfetch/config.jsonc ~/.config/fastfetch/

# Copy Ghostty config (if using Ghostty)
mkdir -p ~/.config/ghostty
cp .config/ghostty/config ~/.config/ghostty/
cp .config/ghostty/switch-theme.sh ~/.config/ghostty/
chmod +x ~/.config/ghostty/switch-theme.sh

# Setup LazyVim for Neovim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
```

5. **Reload your shell:**

```bash
source ~/.zshrc
```

## 🎨 Customization

### Neovim with LazyVim

LazyVim provides a complete IDE experience with:
- **LSP Support** - Full language server protocol for autocompletion and diagnostics
- **Treesitter** - Advanced syntax highlighting
- **Telescope** - Fuzzy finder for files, buffers, and more
- **Git Integration** - Built-in git signs and fugitive

First launch will automatically install all plugins:
```bash
nvim
```

LazyVim keybindings:
- `<space>` - Leader key
- `<space>ff` - Find files
- `<space>fg` - Live grep
- `<space>e` - File explorer
- `<space>l` - Lazy plugin manager

### Starship Prompt

Edit `~/.config/starship.toml` to customize your prompt. See [Starship docs](https://starship.rs/config/) for all options.

Popular presets:
```bash
# Pure preset
starship preset pure-preset > ~/.config/starship.toml

# Nerd Font Symbols preset
starship preset nerd-font-symbols > ~/.config/starship.toml
```

### Fastfetch Display

Edit `~/.config/fastfetch/config.jsonc` to customize the system info display.

View available logos:
```bash
fastfetch --print-logos
```

### Terminal Theme (Ghostty)

Ghostty includes several beautiful dark themes. Change themes easily:

**Quick theme switcher:**
```bash
~/.config/ghostty/switch-theme.sh
```

**Or manually edit** `~/.config/ghostty/config`:
```toml
theme = TokyoNight Storm  # Current theme
```

Available themes:
- Tokyo Night Storm - Stormy cyberpunk vibes
- Catppuccin Mocha - Smooth pastel dark
- Dracula+ - Classic vampire aesthetic
- Nord - Arctic blue minimalism
- Gruvbox Material - Retro warm darkness
- Synthwave Alpha - 80s neon dreams
- Cyberpunk - Futuristic hacker
- Material Ocean - Deep ocean depths
- Monokai Pro - Classic syntax highlighting
- Atom One Dark - Atom-inspired elegance

## 🔧 Configuration Files

- `.zshrc` - Zsh shell configuration with all integrations
- `starship.toml` - Starship prompt configuration
- `fastfetch/config.jsonc` - Fastfetch system info display configuration
- `.config/ghostty/config` - Ghostty terminal configuration
- `.config/ghostty/switch-theme.sh` - Interactive theme switcher for Ghostty
- `.gitignore` - Git ignore rules for the repository
- `~/.config/nvim/` - LazyVim Neovim configuration (created during install)

## 🚀 What Gets Installed

- **Neovim** - Hyperextensible Vim-based text editor
- **LazyVim** - A Neovim config for the lazy (full IDE experience)
- **Starship** - Cross-shell prompt (Rust-based, fast)
- **Fastfetch** - System information tool (C-based, replaces Neofetch)
- **Z** - Directory jumping for quick navigation
- **JetBrains Mono** - Modern coding font with ligatures
- **Symbols Nerd Font** - Icons and symbols for terminal
- **Ghostty Configuration** - GPU-accelerated terminal settings (if Ghostty installed)
- **Developer Tools** - ripgrep, fd, lazygit, node.js for enhanced development
- **Configuration files** - Optimized configs for all tools

## 🔄 Updating

To update the configurations:

```bash
cd ~/code/terminal-config
git pull
cp .zshrc ~/
cp starship.toml ~/.config/
cp fastfetch/config.jsonc ~/.config/fastfetch/
cp -r .config/ghostty ~/.config/
source ~/.zshrc
```

## 🐛 Troubleshooting

### Starship not showing

Make sure Starship is in your PATH:
```bash
which starship
# Should output: /opt/homebrew/bin/starship
```

### Fastfetch not displaying

Check if Fastfetch is installed:
```bash
which fastfetch
# Should output: /opt/homebrew/bin/fastfetch
```

### Fonts look weird

Install a Nerd Font for better icon support:
```bash
brew install --cask font-jetbrains-mono-nerd-font
```

### Performance issues

If shell startup is slow, comment out Fastfetch in `.zshrc`:
```bash
# fastfetch  # Comment this line for faster startup
```

### Ghostty issues

If Ghostty config isn't loading:
```bash
# Check config location
ls ~/.config/ghostty/config

# Reload config in Ghostty
# Press: Cmd+Shift+,
```

Theme not switching:
```bash
# Run the theme switcher
~/.config/ghostty/switch-theme.sh

# Or manually edit the config
vim ~/.config/ghostty/config
```

## 📝 Features in Detail

### Shell Startup Sequence

1. **Fastfetch** displays beautiful system info with Apple logo
2. **Starship** initializes with smart, context-aware prompt
3. **Fallback** to simple prompt if tools aren't available

### Smart Context Display

- **Git branch** - Only shown when in a git repository
- **Node version** - Only shown in JavaScript/Node projects
- **Python version** - Only shown in Python projects
- **Command duration** - Shows execution time for long-running commands
- **Error indicator** - Red arrow when last command failed

## 🤝 Contributing

Feel free to submit issues and pull requests!

## 📄 License

MIT

## 🙏 Credits

- [Starship](https://starship.rs/) - The minimal, blazing-fast, and infinitely customizable prompt
- [Fastfetch](https://github.com/fastfetch-cli/fastfetch) - Fast system information tool
- [Ghostty](https://ghostty.org/) - GPU-accelerated terminal emulator

---

Made with ❤️ for the modern terminal enthusiast