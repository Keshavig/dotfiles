#!/usr/bin/env bash
# A (Rofi) Shell Script for launching various adi1090x/rofi (rofi applets)

# Require: adi1090x/rofi applets (scripts)
APPBINPATH="$HOME/.config/rofi/applets/bin"

goto:
Ask=$(echo -e "Brightness\nColor temperature\nVolume" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "Choose: ";}')
if [[ -z "$Ask" ]]; then
    exit 0
fi


if [[ "$Ask" = "Brightness" ]]; then
    "$APPBINPATH/brightness.sh"
elif [[ "$Ask" = "Color temperature" ]]; then
    "$APPBINPATH/colortemp.sh"
elif [[ "$Ask" = "Volume" ]]; then
     "$APPBINPATH/volume.sh"
fi
