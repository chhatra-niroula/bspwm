#!/bin/bash

if [[ $(xrandr -q | grep 'HDMI-1 connected') ]]; then
    xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal --output HDMI-1 --mode 1920x1080 --rotate normal --left-of eDP-1 
    bspc monitor eDP-1 -d I II III IV V
    #bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8   
    bspc monitor HDMI-1 -d VI VII VIII IX X
	
    outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
    #set -- $outputs
    tray_output=$1

    	for m in $outputs; do
    		if [ $m == $1 ] 
    		then		
    			MONITOR1=$m polybar --reload mybar_external --config=/home/chhatra/.config/polybar/forest/config.ini &	
    		elif [ $m == $2 ]
    		then
    		    tray_output=$m
    			MONITOR2=$m polybar --reload mybar_external --config=/home/chhatra/.config/polybar/forest/config.ini &
    		else
    			MONITOR1=$m polybar --reload mybar_external --config=/home/chhatra/.config/polybar/forest/config.ini &

    	  fi
    	done
else
	xrandr --output HDMI-1 --off
    	xrandr --output eDP-1 --primary --mode 1920x1080 --rotate normal 
    	bspc monitor -d I II III IV V VI VII VIII 
fi
