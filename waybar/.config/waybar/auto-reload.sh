#!/usr/bin/env bash
# Used when testing or modifying waybar / autorefresh
while inotifywait -e modify ~/.config/waybar/
do
    killall -SIGUSR2 waybar
done
