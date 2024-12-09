#!/bin/bash
music=${1:-jez.mp3}
echo $music
#mpc rescan
mpc play 3
echo mpc insert $music
mpc insert $music
mpc
(mpc play 4;sleep 6000;mpc play 3)&
mpc
kill -9 $(ps -ax | grep "sleep 6000" | sed "s/ p.*//")
