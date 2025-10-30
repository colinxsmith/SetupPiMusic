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
cp Setuppimusic/files.zip .
sudo systemctl status mpd
sudo systemctl enable mpd
sudo systemctl restart mpd
sudo systemctl status mpd
mpc
cd sound
mpc add "http://lsn.lv/bbcradio.m3u8?station=bbc_6music&bitrate=96000"
unzip files.zip 
(cd /boot/firmware/;sudo mv config.txt config.txt.old)
(cd /boot/firmware/;sudo cp /home/pi/config.txt .)
(cd /etc; ls mpd.conf asound.conf )
(cd /etc;sudo mv mpd.conf mpd.conf.old)
(cd /etc;sudo cp /home/pi/mpd.conf .)
(cd /etc;sudo cp /home/pi/asound.conf .)
(cd /etc; ls mpd.conf asound.conf )
sudo systemctl status mpd
sudo systemctl restart mpd
sudo systemctl status mpd
sound/findjazz 
mpc add $(grep fm_b sound/*|sed "s/.*u://")
