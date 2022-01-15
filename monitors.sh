#!/bin/sh
count=$(xrandr | grep ' connected' | grep -v VIRTUAL | wc -l)
xrandr --auto
if [ $count -eq 2 ] ;
then
	xrandr --output $(xrandr | grep ' connected' | grep -v VIRTUAL | tail -1 |cut -d\  -f1) --left-of eDP1
elif [ $count -eq 1 ];
then
	xrandr --output eDP1 --mode 1920x1080
elif [ $count -eq 0 ];
then
	echo WTF man
fi
