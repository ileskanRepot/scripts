#!/usr/bin/env bash
[ -z "$1" ] && echo -e "Usage:\ngetYtVideoTitle.sh [Video URL]" && exit

URL=$1
if [ -z $(echo "$URL" | grep "odysee") ];
then
	JSON=$(curl -s "https://www.youtube.com/oembed?url=$URL&format=json" | jq .)
	TITLE=$(echo $JSON | jq -r .title)
	AUTH_NAME=$(echo $JSON | jq -r .author_name)
else
	JSON=$(curl "$URL" | sed -n "/\<script type=\"application\/ld/,/\/script/p" | grep -v script) 
	TITLE=$(echo $JSON | jq -r ."name")
	AUTH_NAME="ODYSEE"
fi

notify-send "Play video $TITLE" "From $AUTH_NAME"
echo -e "$TITLE\n$AUTH_NAME"
