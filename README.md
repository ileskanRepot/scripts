# scripts

# randomKeyboardLayout.sh
Set main keys (a..z) to random positions in keyboard

# downloadCurrentMpvSong.sh
Download currently in mpv playing song
mpv must launch with `--input-ipc-server=/tmp/mpvsocket` flag

# monitors.sh
Configure monitors with xrandr
`-r` flag set second monitor to right of primary monitor

# makeHtmlWebsiteFile.sh
Make simple html directory with index.html and outfit.css
`makeHtmlWebsiteFile.sh <name of file>`

# clipqalc.sh
Pipe clipboard content to `qalc` calculator, then pipe it back to clipboard. With `sed` converts most common `libreoffice math` functions to `qalc` processable.

# getYtVideoTitle.sh
Get youtube video title and uploader from link. And notify-send them
`getYtVideoTitle.sh [Video URL]`
