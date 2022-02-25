#!/bin/sh
COUNT=$(xrandr | grep ' connected' | grep -v VIRTUAL | wc -l)
MAIN=$(xrandr | grep ' connected' | grep -v VIRTUAL | head -1 | cut -d\  -f1)
xrandr --auto
if [ $COUNT -eq 2 ] ;
then
	xrandr --output $(xrandr | grep ' connected' | grep -v VIRTUAL | tail -1 |cut -d\  -f1) --right-of $MAIN
elif [ $COUNT -eq 1 ];
then
	xrandr --output $MAIN --mode 1920x1080
elif [ $COUNT -eq 0 ];
then
	echo WTF man
fi
~/.fehbg
