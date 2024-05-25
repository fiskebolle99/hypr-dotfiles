#!/bin/bash

# directory containing wallpapers
wallpaper_dir="$HOME/.config/hypr/wallpaper/"

# check if the directory exists
if [ ! -d "$wallpaper_dir" ]; then
    echo "error: directory not found: $wallpaper_dir"
    exit 1
fi

# path to the file storing the last used wallpaper
last_wallpaper_file="$HOME/.config/hypr/last_wallpaper"

# pick a random wallpaper that is not the same as the last one
while true; do
    wallpaper=$(find "$wallpaper_dir" -type f | shuf -n 1)
    [ -f "$last_wallpaper_file" ] && last_wallpaper=$(cat "$last_wallpaper_file")
    [ "$wallpaper" != "$last_wallpaper" ] && break
done

# store the current wallpaper as the last used wallpaper
echo "$wallpaper" > "$last_wallpaper_file"

# path to your hyprpaper configuration file
hyprpaper_config_file="$HOME/.config/hypr/hyprpaper.conf"

# update the config file with the new wallpaper path 
sed -i -e "s|^preload = .*$|preload = $wallpaper|" \
       -e "s|^wallpaper = .*$|wallpaper = ,$wallpaper|" \
       "$hyprpaper_config_file"

# reload hyprpaper
pkill hyprpaper
sleep 0.1
hyprpaper &

# let the user know it's done
echo "wallpaper settings in hyprpaper.conf updated successfully with $wallpaper."
