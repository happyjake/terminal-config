# Modern Terminal Configuration
# https://github.com/happyjake/terminal-config

# Docker CLI completions (if Docker is installed)
if [ -d "/Users/$USER/.docker/completions" ]; then
    fpath=(/Users/$USER/.docker/completions $fpath)
fi

# Initialize completion system
autoload -Uz compinit
compinit

# PATH additions
# LM Studio CLI (if installed)
if [ -d "/Users/$USER/.lmstudio/bin" ]; then
    export PATH="$PATH:/Users/$USER/.lmstudio/bin"
fi

# pipx binaries (if installed)
if [ -d "/Users/$USER/.local/bin" ]; then
    export PATH="$PATH:/Users/$USER/.local/bin"
fi

# Terminal improvements
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS SHARE_HISTORY
setopt APPEND_HISTORY INC_APPEND_HISTORY

# Default editor
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
    export VISUAL='nvim'
elif command -v vim &> /dev/null; then
    export EDITOR='vim'
    export VISUAL='vim'
else
    export EDITOR='nano'
    export VISUAL='nano'
fi

# Git info in prompt (for fallback prompt)
autoload -Uz vcs_info
zstyle ':vcs_info:git:*' formats ' %F{cyan}(%b)%f'
zstyle ':vcs_info:*' enable git
setopt PROMPT_SUBST

# Starship prompt with fallback
if command -v starship &> /dev/null; then
    eval "$(starship init zsh)"
else
    # Fallback prompt: directory + git branch + $
    precmd() { vcs_info }
    PROMPT='%F{blue}%~%f${vcs_info_msg_0_} %F{green}$%f '
fi

# Ghostty Shell Integration
if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
    builtin source "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

# Better terminal title
precmd() {
    print -Pn "\e]0;%~\a"
    # Call vcs_info only if not using starship
    if ! command -v starship &> /dev/null; then
        vcs_info
    fi
}

# Terminal splash screen with Fastfetch
if [ -n "${GHOSTTY_RESOURCES_DIR}" ] || [ "$TERM_PROGRAM" = "iTerm.app" ] || [ "$TERM_PROGRAM" = "Terminal.app" ] || [ "$TERM_PROGRAM" = "Apple_Terminal" ]; then
    if command -v fastfetch &> /dev/null; then
        fastfetch
    else
        # Fallback: Simple splash if Fastfetch not available
        echo ""
        echo "  Welcome to $(hostname -s)"
        echo "  $(date '+%A, %B %d, %Y - %H:%M')"
        echo "  macOS $(sw_vers -productVersion 2>/dev/null) | $(uname -m)"
        echo ""
    fi
fi

