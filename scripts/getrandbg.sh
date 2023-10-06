#!/usr/bin/env bash

export SWAYSOCK=/run/user/$(id -u)/sway-ipc.$(id -u).$(pgrep -x sway).sock

# Get a random image from the unsplash website and set it as the background

# Get the image of nature
curl -s -L -o /tmp/bg.jpg "https://source.unsplash.com/1920x1080/?nature"

# Convert to png
convert /tmp/bg.jpg /tmp/bg.png

# Set the image as the background
swaymsg output "*" bg /tmp/bg.png fill
