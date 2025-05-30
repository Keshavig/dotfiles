set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

set fish_greeting
set TERM "xterm-256color"
set EDITOR "nvim"

### "nvim" as manpager
# set -x MANPAGER "nvim +Man!"
### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    fish_default_key_bindings
    # fish_vi_key_bindings
end

### FUNCTIONS ###

# Functions needed for !! and !$
# function __history_previous_command
#   switch (commandline -t)
#   case "!"
#     commandline -t $history[1]; commandline -f repaint
#   case "*"
#     commandline -i !
#   end
# end
#
# function __history_previous_command_arguments
#   switch (commandline -t)
#   case "!"
#     commandline -t ""
#     commandline -f history-token-search-backward
#   case "*"
#     commandline -i '$'
#   end
# end

### ALIASES ###
alias ls='ls --color=always'
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"

# adding flags
alias grep='rg --color=always'
alias mv='mv -v'
alias cp='cp -v'
alias rm='rm -v'
alias clear='clear -x'

fish_config theme choose "Catppuccin Macchiato"
zoxide init fish --cmd cd | source
# eval "$(starship init fish)"
