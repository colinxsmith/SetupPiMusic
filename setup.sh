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
mpc add "http://lsn.lv/bbcradio.m3u8?station=bbc_6music&bitrate=320000"
mpc play 1
mpc play 
mpc
unzip files.zip 
(cd /boot/firmware/;sudo mv config.txt config.txt.old)
(cd /boot/firmware/;sudo cp /home/pi/config.txt .)
(cd /etc;sudo mv mpd.conf mpd.conf.old)
(cd /etc;sudo cp /home/pi/mpd.conf .)
(cd /etc;sudo cp /home/pi/asound.conf .)
(cd /etc; ls mpd.conf asound.conf )
sudo systemctl status mpd
sudo systemctl restart mpd
sudo systemctl status mpd
sound/findjazz 
mpc add $(grep fm_b sound/*|sed "s/.*u://")
sudo apt install ffmpeg
sudo curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp
sudo chmod 777 /usr/local/bin/yt-dlp 
sudo yt-dlp -U
sudo apt install -y libtool autopoint 
sudo apt install -y git git-gui gedit
sudo apt install -y libwww-perl liblwp-protocol-https-perl libmojolicious-perl libxml-libxml-perl libcgi-pm-perl atomicparsley
mkdir iplayer
cd iplayer/
git clone https://github.com/get-iplayer/get_iplayer.git
echo fs.inotify.max_user_watches=524288 | sudo tee /etc/sysctl.d/40-max-user-watches.conf && sudo sysctl --system
cd
sudo apt install mediainfo minidlna -y
sed -i "s/Bullseye/trixie64/g" Setuppimusic/patchminidlna 
(cd /etc;sudo patch< ~/SetupPiMusic/patchminidlna)
mkdir Pictures Videos
(cd /etc;sudo patch< /home/pi/Setuppimusic/patchminidlna)
sudo systemctl status minidlna.service 
sudo systemctl restart minidlna.service 
cd Setuppimusic/
mkdir ~/bin
gcc -O2 testpng.c -o ~/bin/imagedata
cp ~/sound/bashrc ~/.bashrc
cp ~/sound/bash_aliases ~/.bash_aliases
sudo apt install -y imagemagick libexif-dev libjpeg-dev libid3tag0-dev libflac-dev libvorbis-dev libsqlite3-dev libavformat-dev gettext
cd
git clone https://git.code.sf.net/p/minidlna/git minidlna-git
cp Setuppimusic/icons.c minidlana-git
git config --global core.editor vim
git config --global credential.helper store
git config --global user.name "Colin Smith"
git config --global user.email "colinxsmith@gmail.com"
