#!/bin/bash

if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --rotate normal --left-of eDP-1 
    bspc monitor HDMI-1 -d I II III IV 
    #bspc monitor eDP1 -d 1 2 3 4 5 6 7 8   
    bspc monitor eDP-1 -d V VII VII VIII
else
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal 
    bspc monitor -d I II III IV V VI VII VIII 
fi
