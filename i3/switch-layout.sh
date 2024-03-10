#!/bin/bash

current_kb=$(setxkbmap -query | awk '/layout/{print $2}')
layouts=("is" "us")  # Add more layouts as needed

for i in "${!layouts[@]}"; do
    if [ "$current_kb" = "${layouts[$i]}" ]; then
        next_layout_idx=$(( ($i + 1) % ${#layouts[@]} ))
        next_layout=${layouts[$next_layout_idx]}
        echo "Setting layout to $next_layout"
        setxkbmap $next_layout
        notify-send -t 1000 "Layout set to $next_layout"
        exit 0
    fi
done

# If the current layout is not found in the layouts array, switch to the first layout
setxkbmap ${layouts[0]}
