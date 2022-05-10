#!/bin/bash
SONG=$(echo '{ "command": ["get_property", "path"] }' | socat - /tmp/mpvsocket | jq -r ".data" | sed 's/mkv/webm/g')
echo $SONG
NAME=$(echo $SONG | grep -o '[^/]*$')
notify-send "Start" "Downloading $NAME"

if [ "$(echo $SONG | head -c4)" == "http" ];
then
	yt-dlp -x --audio-format mp3 "$SONG" && notify-send "Finish" "Downloaded $NAME" || notify-send "Error" "Error downloading $NAME"
else
	SONGNAME=$(echo $SONG | awk -F/ '{print $NF}' | sed 's/.webm//g')
	echo "'$SONGNAME'"
	SONGREPLACED=$(echo "$SONG" | sed 's/mkv/webm/g' | sed 's/ /\\ /g' | tr -d '\\')
	echo "$SONGREPLACED" | tr -d '\\'
	ffmpeg -i "$SONGREPLACED" -f opus -ab 320000 -vn ~/music/"$SONGNAME.opus" && notify-send "Finish" "Downloaded $NAME" || notify-send "Error" "Error downloading $NAME"
fi
