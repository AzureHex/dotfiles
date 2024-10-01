# Lines configured by zsh-newuser-install

## Prompt ...

# starship
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Colored prompt
#PROMPT='%F{green}%n@%m %F{blue}%~ %F{yellow}%# %f'

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_verify

#bindkey -e

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/eyes/.zshrc'

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' menu no

autoload -Uz compinit
compinit
# End of lines added by compinstall

# zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autocomplete
source ~/.zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# fzf integrations
fcd() {
  local dir
  dir=$(find . -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# Set vertical I-beam cursor
echo -ne "\e[5 q"

# aliasis
alias la='ls -a'
alias l='ls -CF'
alias ll='ls -l'
alias ls='ls --color'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vim='nvim'
alias rain='cmatrix'
alias see='fzf --preview="bat --color=always {}"'
alias change='code $(fzf --preview="bat --color=always {}")'

# Color support for `ls`, `grep`, `pacman`, etc.
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias pacman='pacman --color=auto'

neofetch
