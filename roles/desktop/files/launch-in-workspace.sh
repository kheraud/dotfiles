#!/usr/bin/env bash
xrdb -load ~/.Xresources
CONSOLE_TITLE="workspace-$(xdotool get_desktop)"

wmctrl -a "${CONSOLE_TITLE}" ||
urxvt -sl 0 -title "${CONSOLE_TITLE}" -e tmux new-session -A -s "${CONSOLE_TITLE}"
