#!/usr/bin/env bash
dmenuTextBgColor=$1
dmenuBgColor=$2

SONG=$(echo '{ "command": ["get_property", "path"] }' | socat - /tmp/mpvsocket | jq -r ".data" | sed 's/mkv/webm/g')
[ ! -z $(echo $SONG | grep list) ] && SONG=$(echo $SONG | cut -d\& -f1)
echo $SONG
NAME=$(echo $SONG | grep -o '[^/]*$')

LOCATION=""
QUESTION=$(echo -e "yes\nno" | ~/projects/suckless/dmenu/dmenu -p "Lyrics?" -sb $dmenuTextBgColor -nb $dmenuBgColor)

if [ "$QUESTION" == "yes" ];
then
	LOCATION="lyrics/"
elif [ "$QUESTION" == "no" ];
then
	LOCATION="instrumental/"
fi

notify-send "Start" "Downloading $NAME"

if [ "$(echo $SONG | head -c4)" == "http" ];
then
	yt-dlp -x --audio-format opus "$LOCATION$SONG" && notify-send "Finish" "Downloaded $NAME" || notify-send "Error" "Error downloading $NAME"
else
	SONGNAME=$(echo $SONG | awk -F/ '{print $NF}' | sed 's/.webm//g')
	echo "'$SONGNAME'"
	SONGREPLACED=$(echo "$SONG" | sed 's/mkv/webm/g' | sed 's/ /\\ /g' | tr -d '\\')
	echo "$SONGREPLACED" | tr -d '\\'
	ffmpeg -i "$SONGREPLACED" -f opus -ab 320000 -vn ~/music/"$LOCATION$SONGNAME.opus" && notify-send "Finish" "Downloaded $NAME" || notify-send "Error" "Error downloading $NAME"
fi
