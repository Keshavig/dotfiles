#!/usr/bin/env sh

# MY Creation :(

# DIR="$HOME/clones/wallpapers" #Default directory
# StoreDIR="$HOME/.local/share"

# list=$(ls -l $DIR)
# NoFiles=$(printf "$list\n" | wc -l)

# RandomNum=$(echo $((1 + $RANDOM % $NoFiles)))

# TheFile=$(printf "$list\n" | head -$RandomNum | tail -1 | awk NF)
# Wall=$(echo $TheFile | awk '{print $9}')

# WallPath="$DIR/$Wall"
# echo $WallPath > "$StoreDIR/currentwall.txt"

# feh --bg-fill $WallPath

# wal -i -o $WallPath
# sed -i "s/.*urg.*//g" ~/.cache/wal/colors-wal-dwm.h # for dwm with pywal and without urgent patch
#echo $WallPath > "$StoreDIR/wallhistry" -> Enable If you want your wallpaper history :0


# Chatgpt 2 line creation :) Uncomment following code if you want random wallpaper
# DIR="$HOME/clones/wallpaper"
# RANDOMWALL=$(find $DIR -type f | shuf -n 1)
# xwallpaper --stretch "$RANDOMWALL" &
# feh --fill-bg "$RANDOMWALL"

#xargs xwallpaper --stretch < ~/.cache/wall &
path=$(cat ~/.cache/wall) # Man i know (CAT)
feh --bg-fill $path &
