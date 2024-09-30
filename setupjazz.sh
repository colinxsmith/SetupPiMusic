#!/bin/bash
music=${1:-jez.mp3}
mpc rescan
mpc play 3
mpc insert $music
(mpc play 4;sleep 3850;mpc play 3) &
