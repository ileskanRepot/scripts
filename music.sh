#!/bin/bash
SOURCE="~/music"
if ! [[ -z $TMUX ]];
then
	echo -e "\033[30m\033[101mPlease Do Not Use Tmux While Launching\033[0m"
	read -n 1 -p "Exit tmux [Y/n] " REPLY
	echo
	echo "'$REPLY'"
	if [[ $REPLY =~ [Yy] ]] || [[ -z $REPLY ]]
	then
		tmux kill-session
	fi
	exit
else
	if [ "$(echo $1 | head -c4)" == "http" ];
	then
		SOURCE="\"$1\""
	fi
fi
echo -en "\033]0;st: Music\a"
echo $SOURCE
tmux new -s music "mpv --input-ipc-server=/tmp/mpvsocket $SOURCE --no-video --shuffle" 2>/dev/null || tmux a -t music
