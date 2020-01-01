#/bin/bash


ffmpeg -i $1 -r 10 -ss 15 -t 20 -vf scale=160:90 $2 -hide_banner
