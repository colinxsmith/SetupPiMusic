#/bin/bash
convert $1 -resize 120x120 $2
mogrify -crop 120x120+60+30 $2
