#!/bin/bash

# Switch to dark mode
osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to 1'

# Disable press-and-hold for keys in favor of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false
