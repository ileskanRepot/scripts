# scripts

## randomKeyboardLayout.sh
Set main keys (a..z) to random positions in keyboard\
`randomKeyboardLayout.sh`

## downloadCurrentMpvSong.sh
Download currently in mpv playing song\
mpv must launch with `--input-ipc-server=/tmp/mpvsocket` flag\
`downloadCurrentMpvSong.sh`

## monitors.sh
Configure monitors with xrandr\
`-r` flag set second monitor to right of primary monitor\
`monitors.sh [-r]`

## makeHtmlWebsiteFile.sh
Make simple html directory with index.html and outfit.css\
`makeHtmlWebsiteFile.sh <name of file>`

## clipqalc.sh
Pipe clipboard content to `qalc` calculator, then pipe it back to clipboard. With `sed` converts most common `libreoffice math` functions to `qalc` processable.\
`clipqalc.sh`

## getYtVideoTitle.sh
Get youtube video title and uploader from link. And notify-send them\
`getYtVideoTitle.sh <Video URL>`

## music.sh
Starts new `tmux` session with name `music` and if URL specified play with mpv from that URL otherwise starts playing music from directory `~/music`\
`music.sh [Youtube URL]`

## typeGnuCopypasta.sh
Copy gnu copypasta to clipboard and paste it with `xdotool`\
`typeGnuCopypasta.sh`

## toOpus.sh
Convert `.mp3` songs to `.opus`\
`toOpus.sh`

## displayPlayingMpv.sh
Notify-send currently playing song\
mpv must launch with `--input-ipc-server=/tmp/mpvsocket` flag\
`displayPlayingMpv.sh`

## runCFromClipboard.sh
Paste clipboard to tmp file. Compile it, run it and delete files. (Works only under X enviroment)
`runCFromClipboard.sh`
