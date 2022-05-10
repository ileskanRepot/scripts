#!/bin/bash
SONG=$(echo '{ "command": ["get_property", "path"] }' | socat - /tmp/mpvsocket | jq -r ".data" | sed 's/mkv/webm/g')
# echo $SONG
NAME=$(echo $SONG | grep -o '[^/]*$')

if [ "$(echo $SONG | head -c4)" == "http" ];
then
	URL=$SONG
	if [ -z $(echo "$URL" | grep "odysee") ];
	then
		JSON=$(curl -s "https://www.youtube.com/oembed?url=$URL&format=json" | jq .)
		TITLE=$(echo $JSON | jq -r .title)
	else
		JSON=$(curl "$URL" | sed -n "/\<script type=\"application\/ld/,/\/script/p" | grep -v script)
		TITLE=$(echo $JSON | jq -r ."name")
	fi
else
	TITLE=$(echo $SONG | awk -F/ '{print $NF}' | sed 's/.webm//g')
fi

notify-send "Play video:" "$TITLE"

exit
