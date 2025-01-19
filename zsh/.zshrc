# EXPORTS
export PATH="$HOME/.config/emacs/bin:$HOME/.local/bin:/usr/local/bin:$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin/:$PATH"
export PATH=$HOME/.config/rofi/scripts:$PATH
export PATH=$HOME/.config/rofi/applets/bin:$PATH


# History settings
HISTFILE=~/.zsh_history         # History file location
HISTSIZE=999999                 # Number of commands to keep in memory
SAVEHIST=999999                 # Number of commands to keep in file

# Append to the history file immediately after each command
setopt APPEND_HISTORY           # Append new commands to history file, not overwrite
setopt INC_APPEND_HISTORY       # Save commands as they are entered setopt SHARE_HISTORY
# Avoid duplicate history entries
setopt HIST_IGNORE_DUPS         # Ignore duplicate commands
setopt HIST_IGNORE_ALL_DUPS     # Remove older duplicates in the history file
setopt HIST_FIND_NO_DUPS        # Avoid showing duplicates in history search

# Ensure history is written even if the shell crashes
setopt HIST_SAVE_NO_DUPS        # Avoid saving duplicates on shell exit
setopt HIST_REDUCE_BLANKS       # Remove extra blanks in commands

#PROMPT='\e[0;31m[%n@%m %~]$ '

autoload -U colors && colors

# DOOM ONE
# PROMPT='%F{#ff6c6b}[%F{#ecbe7b}%n%F{#98be65}!%F{#51afef}%m %F{#a9a1e1}%1~ %F{#ff6c6b}]%f%F{#c678dd} -> '

# GRUVBOX
# PROMPT='%F{#fb4934}[%F{#fabd2f}%n%F{#b8bb26}!%F{#83a598}%m %F{#d3869b}%1~ %F{#fb4934}]%f%F{#8ec07c} -> '

# TOKYONIGHT
# PROMPT='%F{#f7768e}[%F{#e0af68}%n%F{#9ece6a}!%F{#7aa2f7}%m %F{#a9a1e1}%1~ %F{#f7768e}]%f%F{#bb9af7} -> '

# ROSE-PINE
#PROMPT='%F{#eb6f92}[%F{#ea9d34}%n%F{#286983}!%F{#9ccfd8}%m %F{#c4a7e7}%1~ %F{#eb6f92}]%f%F{#908caa} -> '

# Catppuccin
PROMPT='%F{#f38ba8}[%F{#f9e2af}%n%F{#a6e3a1}!%F{#89b4fa}%m %F{#b4befe}%1~ %F{#f38ba8}]%f%F{#74c7ec} -> '

# Monokai Pro
# PROMPT='%F{#ff6188}[%F{#ffd866}%n%F{#a9dc76}!%F{#78dce8}%m %F{#ab9df2}%1~ %F{#ff6188}]%f%F{#3399cc} -> '


# DRACULA 
# PROMPT='%F{#ff5555}[%F{#fafa8c}%n%F{#50fa7b}!%F{#8be9fd}%m %F{#bd93f9}%1~ %F{#ff5555}]%f%F{#6272a4} -> '

# For syntax highlighting
### ALIASES ###
alias lsa="exa -al"
# alias ls="exa --icons=always"
alias ls="ls --color=always"
alias edit='nvim $(fzf --preview "bat --style=numbers --color=always --line-range :500 {} 2>/dev/null")'
alias emacs="emacsclient -c -a 'emacs'"

# PACMAN ALIASES #
alias sysup="sudo pacman -Syu --noconfirm && yay -Syu --noconfirm"

# BASIC SHELL ALIASES
alias mkdir="mkdir -pv"
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias rmrn="rm"

# alias mupdf="mupdf -C '#1e1f28'"
alias gdbq="gdb --quiet"

source ~/.config/zshPlugins/fsh/fast-syntax-highlighting.plugin.zsh
source ~/.config/zshPlugins/zsh-autosuggestions/zsh-autosuggestions.zsh
