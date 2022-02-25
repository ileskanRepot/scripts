#!/bin/bash
[ -z "$1" ] && echo -e "Usage:\ngetYtVideoTitle.sh [Video URL]" && exit
JSON=$(curl -s "https://www.youtube.com/oembed?url=$1&format=json" | jq .)
TITLE=$(echo $JSON | jq -r .title)
AUTH_NAME=$(echo $JSON | jq -r .author_name)
notify-send "Play video $TITLE" "From $AUTH_NAME"
echo -e "$TITLE\n$AUTH_NAME"
