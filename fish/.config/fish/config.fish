set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

set fish_greeting
set TERM "xterm-256color"
set EDITOR "nvim"

### "nvim" as manpager
set -x MANPAGER "nvim +Man!"
### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  fish_default_key_bindings
  # fish_vi_key_bindings
end

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
# set fish_color_autosuggestion '51afef'
# set fish_color_command brcyan
# set fish_color_error '#ff6c6b'
# set fish_color_param brcyan

### FUNCTIONS ###

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

### ALIASES ###
# Changing "ls" to "eza"
alias ls='ls --color=always'
# alias ls='exa --color=always -al'
alias pipes.sh='pipes.sh -p 10 -r 200000000000 -R'

# get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# adding flags
alias df='df -h'               # human-readable sizes
alias free='free -m'           # show sizes in MB
alias grep='grep --color=auto' # colorize output (good for log files)
alias vim='nvim'
alias sudo='doas'

# colorscript random
# fastfetch

zoxide init fish | source
# starship init fish | source

eval "$(zoxide init --cmd cd fish)"

function fish_prompt
    # The current directory
    set short_pwd (realpath . )

    set count_slash (echo $short_pwd | grep -o "/" | wc -l)
    set count_slash (math $count_slash + 1)
    set short_pwd ( echo $short_pwd | cut -d'/' -f$count_slash)

    # set git_branch ""
    # if git rev-parse --is-inside-work-tree >/dev/null 2>&1
    #     set git_branch (git rev-parse --abbrev-ref HEAD)
    #     echo -e "\033[31m[\033[33m$(whoami)\033[32m!\033[34m$(uname -n) \033[35m$short_pwd \033[32m@$git_branch\033[31m]\033[36m>\033[0m "
    # else
        echo -e "\033[31m[\033[33m$(whoami)\033[32m!\033[34m$(uname -n) \033[35m$short_pwd\033[31m]\033[36m>\033[0m "
    # end

    # Construct and display the prompt
end
