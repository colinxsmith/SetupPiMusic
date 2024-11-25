#!/bin/bash
music=${1:-jez.mp3}
mpc rescan
mpc play 3
mpc insert $music
(mpc play 4;sleep 6000;mpc play 3) &
kill -9 $(ps -ax | grep sleep | sed "s/ p.*//")
