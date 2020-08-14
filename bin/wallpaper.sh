#!/bin/bash
##Copyright Oliver Baker
files=("$HOME/wallpaper/"*) #Set wallpaper dir
while true; do
if [ $(xrandr | awk 'BEGIN {count = 0;} / connected/ {count++1} END{print count}') -eq 1 ];
then
feh --bg-scale ${files[RANDOM % ${#files[@]}]}
elif [ $(xrandr | awk 'BEGIN {count = 0;} / connected/ {count++1} END{print count}') -eq 2 ]; 
then
wallpaperleft=${files[RANDOM % ${#files[@]}]}  #choose a left wallpaper
wallpaperright=${files[RANDOM % ${#files[@]}]} #choose a right wallpaper
while [ "$wallpaperleft" == "$wallpaperright" ]; do #Choose a new right wallpaper until the don't match
wallpaperright=${files[RANDOM % ${#files[@]}]} 
done
feh --bg-scale $wallpaperleft $wallpaperright
fi
sleep $(shuf -i 300-900 -n 1)
done
