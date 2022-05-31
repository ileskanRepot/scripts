#!/bin/bash
SOURCE="~/music"
SHUFFLE="--shuffle"
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
		SHUFFLE=""
	fi
fi
echo -en "\033]0;st: Music\a"
echo $SOURCE
echo "\"$SHUFFLE\""
tmux new -s music "mpv --hwdec=auto --ytdl-format=best --ytdl-raw-options=yes-playlist= -fs --input-ipc-server=/tmp/mpvsocket $SOURCE --no-video $SHUFFLE" 2>/dev/null || tmux a -t music
