#!/usr/bin/dash

# assist: play/pause music

# if ! command -v spotify >/dev/null 2>&1; then
# playerctl play-pause
dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
    # exit 0
# fi
#
# if pgrep spotify >/dev/null 2>&1; then
#     # pauses spotify player
#     spoticli t
#     exit
# else
#     if playerctl status || true | grep .; then
#         playerctl play-pause
#     else
#         spoticli
#     fi
# fi
