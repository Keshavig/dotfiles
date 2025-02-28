# EXPORTS

export PATH="$HOME/.config/emacs/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"
export PATH=$HOME/.config/rofi/scripts:$PATH
export PATH=$HOME/.config/rofi/applets/bin:$PATH
export PATH=$HOME/.local/include/imgui:$HOME/.local/include/imgui/backends/:$PATH

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# prompt

# eval "$(oh-my-posh init zsh --config $HOME/.config/omp/config.toml)" # Makes my head hurt

autoload -U colors && colors

git_branch() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    [[ -n "$branch" ]] && echo " %F{#98be65}( $branch%F{#98be65})"
}

autoload -Uz add-zsh-hook
update_prompt() {
     PROMPT='%F{#f7768e}[%F{#e0af68}%n%F{#9ece6a}!%F{#7aa2f7}%m %F{#a9a1e1}%1~'"$(git_branch)"' %F{#f7768e}]%f%F{#bb9af7}$ '
    # PROMPT='%F{#eb6f92}[%F{#ea9d34}%n%F{#286983}!%F{#9ccfd8}%m %F{#c4a7e7}%1~'"$(git_branch)"' %F{#eb6f92}]%f%F{#908caa}$ '
    # PROMPT='%F{#ff6c6b}[%F{#ecbe7b}%n%F{#98be65}!%F{#51afef}%m %F{#a9a1e1}%1~'"$(git_branch)"'%F{#ff6c6b}]%f%F{#c678dd}$ '
}

add-zsh-hook precmd update_prompt

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=999999
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
# alias ls="exa --color=always"
alias ls="ls --color=always"
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
colorscript -r
