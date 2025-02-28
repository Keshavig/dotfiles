#!/usr/bin/env bash

# What is the function of this program
# Following program helps to easily switch between various rofi themes and launchers
# This script is based on various themes by adi1090x/rofi
# you can easily install these themes through https://github.com/adi1090x/rofi
# Before using this make sure to add @import "~/.config/rofi/launchers/type-any/style-any.rasi" it can be of any type just
# make sure to have that line
# To change themes as well make sure to have @import "~/.config/rofi/colors/onedark.rasi" or any color.rasi imported
#
# Change the theme as well
#
#

ActChoice() {
    Actualchoice=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    echo "$Actualchoice"
}

print() {
    a=""
    for ((i = 1; i <= $1; i++))
    do
        a="$a""Style-$i"
        if ((i < $1)); then
            a="$a\n"
        fi
    done

    echo -e "$a"
 }

DIR="$HOME/.config/rofi"
MainChoice=$(echo -e "Theme\nLauncher" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "What do you want to change: ";}')

# -theme-str changes the launcher config just for that specific instance of rofi
# -p (prompt) option was not working for me, something with adi1090x's configs may have caused it idk
# So im changing the launcher config just for the prompt :)

# Kill the program if user chooses to quit
if [ -z "$MainChoice" ]; then
   exit 0
fi

if [ "$MainChoice" = "Launcher" ]; then

        choices1=$(echo -e "Type-1\nType-2\nType-3\nType-4\nType-5\nType-6\nType-7" | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "Which type of launcher do you want: ";}')

        # Quit program if user decides
        if [[ -z "$choices1" ]]; then
            notify-send "Quitting program"
            exit 0
        fi

         Achoice=$(ActChoice "$choices1")
         echo "$Achoice"

         Subdir="$DIR/launchers/$Achoice"
         noFiles=$(find "$Subdir" | grep -c style)


         choices2=$(print $noFiles | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "What style of launcher do you want: ";}');

        # Quit program if user decides
        if [[ -z "$choices2" ]]; then
            notify-send "Quitting program"
            exit 0
        fi

         Achoice2=$(ActChoice "$choices2")

         #Path="$DIR/launchers/$Achoice/$Achoice2.rasi"

         sed -i "s#@import \"~/.config/rofi/launchers/.*#@import \"~/.config/rofi/launchers/$Achoice/$Achoice2.rasi\"#" "$DIR/config.rasi"
         notify-send "Launcher successfully changed to $Achoice/$Achoice2"

elif [ "$MainChoice" = "Theme" ]; then

        #choices=$(ls ""$DIR/colors | cut -d '.' -f1 | tr '[[:lower:]]' '[[:upper:]]' | rofi -dmenu -p "What theme do you want:")
        choices=$(find "$DIR/colors" -type f -printf "%f\n" | cut -d '.' -f1 | rofi -dmenu -theme-str 'textbox-prompt-colon {str: "Choose your preferred theme: ";}')

        # Quit program if user decides
        if [[ -z "$choices" ]]; then
            notify-send "Quitting program"
            exit 0
        fi

        Achoice=$(ActChoice "$choices")
        notify-send "$Achoice"

        sed -i "s|@import \"~/.config/rofi/colors.*|@import \"~/.config/rofi/colors/$Achoice.rasi\"|" $DIR/config.rasi
        notify-send "Theme Successfully changed to $Achoice"
fi
