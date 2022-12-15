#!/usr/bin/env bash
NAME=$RANDOM
xclip -selection clipboard -o > /tmp/$NAME.c
gcc /tmp/$NAME.c -o /tmp/$NAME && /tmp/$NAME
rm /tmp/$NAME
rm /tmp/$NAME.c
