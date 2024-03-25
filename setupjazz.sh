#!/bin/bash
mpc rescan
mpc play 3
mpc insert jez.mp3
(mpc play 4;sleep 4000;mpc play 3)
