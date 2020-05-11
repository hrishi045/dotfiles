# Prompt
autoload -U colors && colors
setopt promptsubst
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='[%F{yellow}%?%f]'

# Ctrl+Left and Ctrl+Right for word navigation
bindkey -e
bindkey '^[[1;5C' emacs-forward-word
bindkey '^[[1;5D' emacs-backward-word

## === Arch-specific ===

function paclist() {
	LC_ALL=C pacman -Qei $(pacman -Qu | cut -d " " -f 1) | \
		awk 'BEGIN {FS=":"} /^Name/{printf("\033[1;36m%s\033[1;37m", $2)} /^Description/{print $2}'
	}

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.npm-global/bin"
PATH="$PATH:$HOME/.yarn/bin"
PATH="$PATH:$HOME/scripts"
PATH="$PATH:$HOME/.gem/ruby/2.7.0/bin"
PATH="$PATH:$HOME/.emacs.d/bin"
export PATH

# Vars
export GEM_HOME=$HOME/.gem
export EDITOR="nvim"
export BROWSER="chromium"
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hrishi/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "/home/hrishi/anaconda3/etc/profile.d/conda.sh" ]; then
		. "/home/hrishi/anaconda3/etc/profile.d/conda.sh"
	else
		export PATH="/home/hrishi/anaconda3/bin:$PATH"
	fi
fi
unset __conda_setup
# <<< conda initialize <<<

function casm() {
	yasm -g dwarf2 -f elf64 $1.asm -l $1.lst
	ld -g -o $1 $1.o
}


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

zinit light zsh-users/zsh-completions

zinit load zdharma/history-search-multi-word
zinit load zdharma/zui
zinit ice from"gh-r" as"program"; zinit load junegunn/fzf-bin
zinit light zsh-users/zsh-autosuggestions
zinit ice atinit"zicompinit; zicdreplay"
zinit light zdharma/fast-syntax-highlighting
zinit snippet OMZL::git.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit ice atload"unalias grv"
zinit snippet OMZP::git
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::colored-man-pages
zinit snippet OMZP::cp
zinit snippet OMZP::systemd
zinit snippet OMZP::fzf
zinit snippet PZT::modules/utility/init.zsh
zinit load lukechilds/zsh-nvm

zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

### End of Zinit's installer chunk
