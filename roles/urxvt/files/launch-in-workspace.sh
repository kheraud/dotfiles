#!/usr/bin/env bash
xrdb -merge ~/.Xresources
urxvt -sl 0 -e sh -c 'tmux new-session -A -s "workspace-$(xdotool get_desktop)"'
