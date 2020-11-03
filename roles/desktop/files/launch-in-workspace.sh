#!/usr/bin/env bash
xrdb -merge ~/.Xresources
CONSOLE_TITLE="workspace-$(xdotool get_desktop)"
urxvt -sl 0 -title "${CONSOLE_TITLE}" -e tmux new-session -A -s "${CONSOLE_TITLE}"
