#!/usr/bin/env sh

# Makesure to install sct and brightnessctl before using this bs
# In arch based distros just do
# sudo pacman -S sct brightnessctl
# also DEFINIETLY INSTALL ROFIII

MaxBright=$(brightnessctl max)
CurrentBright=$(brightnessctl get)
CurrentBrPerc=$(( ($CurrentBright * 100) / $MaxBright))


# Ask the user
WhatToChange=$(echo -e "Color Temperature\nBrightness" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "What do you want to change: ";}');

#MAIN IF 0 Exit the program if user chooses so
if [[ -z "$WhatToChange" ]]; then
    exit 0
fi #MAIN IF 0 CLOSED

#MAIN IF 1
if [[ "$WhatToChange" = "Brightness" ]]; then
    HowMuchChange=$(echo -e "Current Brightness % : $CurrentBrPerc%\nRange [1% - 100%]\nEnter 100% or max for maximum Brightness\nEnter 1% or min for minimum Brightness" \
    | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "Brightness in percentage(never 0%!!!): ";}')

#MAIN IF 1 -> SUB IF 1 => Close the program if user enters nothing
    if [[ -z "$HowMuchChange" ]]; then
        notify-send "No change was commited!!"
        exit 0
    fi #SUB IF 1 CLOSED


#MAIN IF 1 -> SUB IF 2
    if [[ "$HowMuchChange" =  "100%" || "$HowMuchChange" = "max" ]]; then
        brightnessctl set 100%
        exit 0
#MAIN IF 1 -> SUB IF 2 -> SUB EF 1
    elif [[ "$HowMuchChange" = "0%" ]]; then
       choice=$(echo "Are your sure, this will black out your screen. You may need to restart your pc[Yy/Nn]" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "WARNING!!!"}')

#MAIN IF 1 -> SUB IF 2 -> SUB EF 1 -> SUB IF 1
       if [[ "$choice" = "y" || "$choice" = "Y" ]]; then
           brightnessctl set 0%
           exit 0
#MAIN IF 1 -> SUB IF 2 -> SUB EF 1 -> SUB IF 1 -> SUB EF 1
       elif [[ "$choice" = "n" || "$choice" = "N" ]]; then
           exit 0
       fi #MAIN IF 1 -> SUB IF 2 -> SUB EF 1 -> SUB IF 1 CLOSED


#MAIN IF 1 -> SUB IF 2 -> SUB EF -> 1
elif [[ "$HowMuchChange" = "min" ]]; then
    brightnessctl set 1%
    exit 0


#MAIN IF 1 -> SUB IF 2 -> SUB EF -> 2
elif [[ ! "$HowMuchChange" =~ ^[0-9]+$ ]]; then
    echo "Either Enter a discrete number within the range provided or choose min/max brightness"
    exit 0

#MAIN IF 1 -> SUB IF 2 -> ELSE
else
    brightnessctl set $HowMuchChange
fi #MAIN IF 1 -> SUB IF 2 CLOSED

#MAIN IF 1 -> EF 1
elif [ "$WhatToChange" = "Color Temperature" ]; then
    options=$(echo -e "Range [1000 To 10000]\nWarm tones: [1000 - 3500] [Reddish]\nNeutral tones: [5000-6500] [Daylight White]\nCool tones [7500 - 10000] [Bluish]\nNight Mode [3700]\nNormal Mode [6500]" \
        | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "Choose anything inbetween provided range: ";}')

# MAIN IF 1 -> EF 1 -> IF 0 -> Close the program if user enters nothing
    if [[ -z "$options" ]]; then
        exit 0
    fi # MAIN IF 1 -> EF 1 -> IF 0 CLOSED

    #MAIN IF 1 -> EF 1 -> IF 1 ==> Understand as Main if statement -> Else Statement -> If Statement (-> could be understood as insides)
    if [[ "$options"  = "Night Mode [3700]" ]]; then
        sct 3700
        exit 0

    #MAIN IF 1 -> EF 1 -> IF 1 -> EF 1
    elif [[ "$options" = "Normal Mode [6500]" ]]; then
        sct 6500
        exit 0
    fi #MAIN IF 1 -> EF 1 -> IF 1 CLOSED

    #MAIN IF 1 -> EF 1 -> IF 2 ==> Checks if user entered a string and if so then throws an error
    if [[ ! "$options" =~ ^[0-9]+$ ]]; then
        notify-send "Please enter One of the two (Night/Normal mode) or a definite integer between provided range"

    #MAIN IF 1 -> EF 1 -> IF 2 -> EF 1
    elif [[ "$Options" -lt 1000 || "$Options" -gt 10000 ]]; then
        notify-send "Please enter a value between 1000 and 10000."
        exit 1

        #MAIN IF 1 -> EF 1 ->  IF 2 -> ELSE
    else
        sct $options
    fi #MAIN IF 1 -> EF 1 -> IF 2 CLOSED

fi #MAIN IF 1 CLOSED
