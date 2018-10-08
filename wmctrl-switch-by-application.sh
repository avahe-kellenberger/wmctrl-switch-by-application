#!/usr/bin/env bash

# Get id of the focused window.
active_win_id=$(xprop -root | grep '^_NET_ACTIVE_W' | awk -F'# 0x' '{print $2}')

# Get window manager class of focused window.
win_class=$(wmctrl -x -l | grep "$active_win_id" | awk '{print $2 " " $3}' )

# Retrieve list of all windows matching with the class above.
win_list=$(wmctrl -x -l | grep -- "$win_class" | awk '{print $1}' )

# Find the next window to focus.
switch_to=$(echo "$win_list" | grep -Pazo "(?<=${active_win_id}\n)[^\n]*" | awk '{print $1}')

# If the current window is the last in the list, take the first one.
if [ -z "$switch_to" ];then
   switch_to=$(echo "$win_list" | awk '{print $1}')
fi

# Switch to next window.
wmctrl -i -a "$switch_to"