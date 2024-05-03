#!/usr/bin/env bash
xrdb -load ~/.Xresources
CONSOLE_TITLE="workspace-$(xdotool get_desktop)"

wmctrl -a "${CONSOLE_TITLE}" ||
alacritty --title "${CONSOLE_TITLE}" --command tmux new-session -A -s "${CONSOLE_TITLE}"
