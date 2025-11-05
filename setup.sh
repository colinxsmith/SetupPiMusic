sudo apt update
sudo apt upgrade
sudo apt install id3v2 mpc mpd git
git clone https://github.com/colinxsmith/SetupPiMusic
git clone https://github.com/colinxsmith/sound
sudo systemctl status bluetooth 
sudo systemctl enable bluetooth 
sudo rfkill unblock 0
mkdir Music playlists Pictures Videos
mkdir Music/mp3
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
cd
cp SetupPiMusic/files.zip .
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
cd
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
sed -i "s/Bullseye/trixie64/g" SetupPiMusic/patchminidlna 
(cd /etc;sudo patch< ~/SetupPiMusic/patchminidlna)
(cd /etc;sudo patch< /home/pi/SetupPiMusic/patchminidlna)
sudo systemctl status minidlna.service 
sudo systemctl restart minidlna.service 
cd SetupPiMusic/
mkdir ~/bin
gcc -O2 testpng.c -o ~/bin/imagedata
cp ~/sound/bashrc ~/.bashrc
cp ~/sound/bash_aliases ~/.bash_aliases
sudo apt install -y imagemagick libexif-dev libjpeg-dev libid3tag0-dev libflac-dev libvorbis-dev libsqlite3-dev libavformat-dev gettext
cd
git config --global core.editor vim
git config --global credential.helper store
git config --global user.name "Colin Smith"
git config --global user.email "colinxsmith@gmail.com"
curl -L https://sourceforge.net/projects/minidlna/files/latest/download > minidlna.tar.gz
gunzip minidlna.tar.gz 
tar xf minidlna.tar 
cp SetupPiMusic/icons.c minidlana-1.3.3
mkdir picsetup
cd picsetup/
cp ../SetupPiMusic/makepic .
cp ~/ak.jpg .
./makepic 
cp ../SetupPiMusic/icons.c .
cd
cp picsetup/* minidlna-1.3.3
cd minidlna-1.3.3
curl -L https://sourceforge.net/p/minidlna/patches/204/attachment/0001-libav.h-fix-build-with-ffmpeg-7.0.patch>patchfix
patch < patchfix 
./autogen.sh 
./configure --prefix=$(pwd)
make
make install
sudo mv /usr/sbin/minidlnad /usr/sbin/minidlnad.old
sudo cp sbin/minidlnad /usr/sbin/
sudo systemctl restart minidlna.service 
cd
sudo apt install vim
SetupPiMusic/vimrc .vimrc
sudo systemctl restart minidlna.service 
mpc add "http://lsn.lv/bbcradio.m3u8?station=bbc_6music&bitrate=320000"
sound/findjazz 
mpc add $(grep fm_b sound/*|sed "s/.*u://")
chmod 777 Music/ Videos/ Pictures/
sudo systemctl restart minidlna.service 
