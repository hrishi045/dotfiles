# Prompt
autoload -U colors && colors
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='[%F{yellow}%?%f]'

# Basic completion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
setopt COMPLETE_ALIASES

# Ctrl+Left and Ctrl+Right for word navigation
bindkey -e
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word
 
## === Arch-specific ===

# Pacman
alias pacin='sudo pacman -S'
alias pacupg='sudo pacman -Syu'
alias pacre='sudo pacman -R'
alias pacupd='sudo pacman -Syy'
alias pacls='pacman -Ql'

function paclist() {
    LC_ALL=C pacman -Qei $(pacman -Qu | cut -d " " -f 1) | \
    awk 'BEGIN {FS=":"} /^Name/{printf("\033[1;36m%s\033[1;37m", $2)} /^Description/{print $2}'
}

# Yay
alias yain='yay -S'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
