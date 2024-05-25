#!/bin/bash

# directory containing wallpapers
wallpaper_dir="$HOME/.config/hypr/wallpaper/"

# check if the directory exists
if [ ! -d "$wallpaper_dir" ]; then
    echo "error: directory not found: $wallpaper_dir"
    exit 1
fi

# pick a random wallpaper from the directory
wallpaper=$(find "$wallpaper_dir" -type f | shuf -n 1)

# check if a wallpaper was found
if [ -z "$wallpaper" ]; then
    echo "error: no wallpapers found in the directory: $wallpaper_dir"
    exit 1
fi

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
