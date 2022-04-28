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
fi
tmux new -s music 'mpv ~/music --no-video --shuffle' 2>/dev/null || tmux a -c music
