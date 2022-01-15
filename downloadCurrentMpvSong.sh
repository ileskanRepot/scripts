#!/bin/bash
notify-send 'Start' 'Download started'
SONG=$(echo '{ "command": ["get_property", "path"] }' | socat - /tmp/mpvsocket | jq -r ".data" | sed 's/mkv/webm/g')

if [ "$(echo $SONG | head -c4)" == "http" ];
then
	yt-dlp -x --audio-format mp3 "$SONG"
else
	SONGNAME=$(echo $SONG | awk -F/ '{print $NF}' | sed 's/.webm//g')
	SONGREPLACED=$(echo "$SONG" | sed 's/mkv/webm/g')
	ffmpeg -i "$SONGREPLACED" -f mp3 -ab 320000 -vn ~/music/"$SONGNAME.mp3"
fi

notify-send 'Finish' 'Download finished'
