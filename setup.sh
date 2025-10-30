sudo apt update
sudo apt upgrade
sudo apt install id3v2 mpc mpd git
sudo raspi-config 
sudo systemctl status bluetooth 
sudo systemctl enable bluetooth 
sudo rfkill unblock 0
mkdir Music playlists
mkdir Music/mp3
git clone https://github.com/colinxsmith/sound
git clone https://github.com/colinxsmith/Setuppimusic
sudo systemctl status mpd
sudo systemctl enable mpd
sudo systemctl restart mpd
sudo systemctl status mpd
mpc
cd sound
mpc add "http://lsn.lv/bbcradio.m3u8?station=bbc_6music&bitrate=96000"
mpc play 1
mpc play 
cd ~/Setuppimusic/
