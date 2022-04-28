#!/bin/sh
END=".mp3"
for i in *$END;
do
	ffmpeg -i "$i" "$(echo "$i" | sed \"s/$END/opus/g\")" || exit
	rm "$i"
done
