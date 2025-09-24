#!/bin/bash
# Ghostty Theme Switcher - Quick dark theme switcher

CONFIG_FILE="$HOME/.config/ghostty/config"

echo "🎨 Ghostty Dark Theme Switcher"
echo "=============================="
echo ""
echo "Select your dark theme:"
echo "  1) Tokyo Night Storm  - Stormy cyberpunk vibes"
echo "  2) Catppuccin Mocha  - Smooth pastel dark"
echo "  3) Dracula+          - Classic vampire aesthetic"
echo "  4) Nord              - Arctic blue minimalism"
echo "  5) Gruvbox Material  - Retro warm darkness"
echo "  6) Synthwave Alpha   - 80s neon dreams"
echo "  7) Cyberpunk         - Futuristic hacker"
echo "  8) Material Ocean    - Deep ocean depths"
echo "  9) Monokai Pro       - Classic syntax highlighting"
echo " 10) One Dark          - Atom-inspired elegance"
echo ""
read -p "Enter choice (1-10): " choice

case $choice in
    1) theme="TokyoNight Storm" ;;
    2) theme="Catppuccin Mocha" ;;
    3) theme="Dracula+" ;;
    4) theme="Nord" ;;
    5) theme="Gruvbox Material" ;;
    6) theme="Synthwave Alpha" ;;
    7) theme="Cyberpunk" ;;
    8) theme="Material Ocean" ;;
    9) theme="Monokai Pro" ;;
    10) theme="Atom One Dark" ;;
    *) echo "Invalid choice!"; exit 1 ;;
esac

# Update the config file
sed -i '' "s/^theme = .*/theme = $theme/" "$CONFIG_FILE"

echo ""
echo "✅ Theme changed to: $theme"
echo "🔄 Reload Ghostty config with: Cmd+Shift+,"
echo ""