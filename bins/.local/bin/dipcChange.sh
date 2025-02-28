#!/usr/bin/env bash

# What do i want this program to do
# Input Folder:
# Output Folder:
# Into Theme:

# Install dipc with (cargo install dipc) before using this script

DIPC_CUSTOM_THEME_DIR="$HOME/.local/share/dipc/themes"

# Builtin themes list
builtin_themes=(
    "catppuccin"
    "dracula"
    "edge"
    "everforest"
    "gruvbox"
    "gruvbox-material"
    "nord"
    "onedark"
    "rose-pine"
    "solarized"
    "tokyo-night"
)

# Non-builtin themes (from custom theme directory)
not_builtin_themes=$(ls -l $DIPC_CUSTOM_THEME_DIR | awk '{print $9}' | awk 'NF' | sed 's/.json//')

# Convert built-in themes array into a newline-separated string
builtin_theme_list=$(IFS=$'\n'; echo "${builtin_themes[*]}")

# Rofi command function (for selecting paths and themes)
roficmd()
{
    local prompt="${1:-'Explore'}"
    local columns="${2:-1}"
    local lines="${3:-7}"

    echo -e "rofi -dmenu -theme-str 'textbox-prompt-colon {str: \"$prompt\";} listview {enabled: true; columns: $columns; lines: $lines;}'"
}

# Ask for user inputs
roficommand1=$(roficmd "Enter input folder path: " 3 2)
roficommand2=$(roficmd "Enter output folder path: " 3 2)
roficommand3=$(roficmd "Choose: " 2 7)

# Get the theme choice (either "Builtin Themes" or "Non Builtin Themes")
chose=$(echo -e "Builtin Themes\nNon Builtin Themes" | eval "$roficommand3")

if [[ -z "$chose" ]]; then
    exit 1
fi

# Handle theme choice
if [[ "$chose" = "Builtin Themes" ]]; then
    selected_theme=$(echo -e "$builtin_theme_list" | eval "$roficommand3")
    echo "You chose a built-in theme: $selected_theme"
elif [[ "$chose" = "Non Builtin Themes" ]]; then # Display custom themes
    selected_theme=$(echo -e "$not_builtin_themes" | eval "$roficommand3")
    echo "You chose a non-built-in theme: $selected_theme"
else
    echo "Error: Invalid input provided"
    exit 1
fi

# Get input and output folder paths
IF=$(eval "$roficommand1")
OF=$(eval "$roficommand2")

if [[ -z "$IF" ]]; then
    exit 1
fi

if [[ -z "$OF" ]]; then
    exit 1
fi

echo "You provided: IF: $IF, OF: $OF"
