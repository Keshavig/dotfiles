#!/usr/bin/env sh
# Make sure to install rofi brightnessctl and sct
# for arch based distros
# sudo pacman -S rofi brightnessctl sct
# should work

while true; do
    # Main menu
    WhatToChange=$(echo -e "Brightness\nColor Temperature\nExit" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "What do you want to change: ";}')

    # Exit the loop if no input or "Exit"
    if [[ -z "$WhatToChange" || "$WhatToChange" = "Exit" ]]; then
        exit 0
    fi

    case "$WhatToChange" in
        "Brightness")
            # Brightness menu
            MaxBright=$(brightnessctl max)
            CurrentBright=$(brightnessctl get)
            CurrentBrPerc=$(( ($CurrentBright * 100) / $MaxBright ))

            HowMuchChange=$(echo -e "Current Brightness: $CurrentBrPerc%\nRange [1% - 100%]\nEnter 100% or max for maximum\nEnter 1% or min for minimum" \
            | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "Brightness in percentage (never 0%!!!): ";}')

            if [[ -z "$HowMuchChange" ]]; then
                notify-send "No change was committed!"
                continue
            fi

            if [[ "$HowMuchChange" = "100%" || "$HowMuchChange" = "max" ]]; then
                brightnessctl set 100%
            elif [[ "$HowMuchChange" = "1%" || "$HowMuchChange" = "min" ]]; then
                brightnessctl set 1%
            elif [[ "$HowMuchChange" =~ ^[0-9]+%?$ ]]; then
                brightnessctl set "$HowMuchChange"
            else
                notify-send "Invalid input. Please enter a valid percentage or min/max."
            fi
            ;;

        "Color Temperature")
            # Color temperature menu
            Options=$(echo -e "Night Mode [3700]\nNormal Mode [6500]\nRange [1000 - 10000]" \
            | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "Choose a color temperature: ";}')

            if [[ -z "$Options" ]]; then
                notify-send "No change was committed!"
                continue
            fi

            if [[ "$Options" = "Night Mode [3700]" ]]; then
                sct 3700
            elif [[ "$Options" = "Normal Mode [6500]" ]]; then
                sct 6500
            elif [[ "$Options" =~ ^[0-9]+$ ]]; then
                if [[ "$Options" -ge 1000 && "$Options" -le 10000 ]]; then
                    sct "$Options"
                else
                    notify-send "Please enter a value between 1000 and 10000."
                fi
            else
                notify-send "Invalid input. Please choose a valid option."
            fi
            ;;

        *)
            notify-send "Invalid selection. Please try again."
            ;;
    esac
done
