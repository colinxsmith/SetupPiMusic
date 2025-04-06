# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w \$\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
alias killpy='kill -9 `ps -u pi | sed -n "/python/s/p.*//p"`'
alias killpdf='kill -9 `ps -u pi | sed -n "/evince/s/e.*//p"`'
alias killR='kill -9 `ps -u pi | sed -n "/R/s/R.*//p"`'
alias killoct='kill -9 `ps -u pi | sed -n "/octave-cli/s/o.*//p"`'
alias killchrome='for i in `ps -u pi|grep chrom |sed "s/ ?.*//"`; do kill -9 $i; done'
alias killnon='kill -9 `ps -u pi | awk '\''/nonlineartune/{ print $1 }'\''`'
alias killmed='kill -9 `ps -u pi | awk '\''/mediatomb/{ print $1 }'\''`'
alias listrtn='awk -F, '\''!(/.*-.*-/)&&(NF>20) {print ($NF-$(NF-1))/$(NF-1)}'\'' fundsae'
alias secondsalive='(now=`date +%s`;me=`date --date="10/13/1955 22:45:00" +%s`;echo $now $me|awk '\''{ print $1-$2 }'\'')'
alias hourssalive='(now=`date +%s`;me=`date --date="10/13/1955 22:45:00" +%s`;echo $now $me|awk '\''{ print ($1-$2)/3600 }'\'')'
alias testsafe='(cd ~/safeqp/;export LD_LIBRARY_PATH=`pwd`;python -c "from safe import version;print version();")'
alias checkres='sed -n "/esult/,+1p"|awk '\''/[0-9]/{n=int($1+0.5);print $1,($1-n)/n;}'\'''
alias FINAL='date +%Y\ %m\ %d | awk '\'' {a=$1;b=$2;c=$3;if (b>10) a+=1;else if (b==10&&c>=13) a+=1};END{print 11"/"10"/"a}'\'''
export KERN=`uname -r | awk 'BEGIN {FS="-";OFS="-"};{if($2)print $1,$2;else print $1}'`
GetInfo()
{
    info=$(mediainfo "$f" | sed -r 's/[ ]+:[ ]/|/') 
      bitrate=$(echo "$info" | awk -F'|' '$1=="Bit rate" {gsub(/([ A-Za-z]+)/,"",$2); print$2}')
}
alias convertaac='for f in *.aac; do GetInfo;ffmpeg -i "$f" -ab ${bitrate}k "${f%.aac}.mp3"; done'
alias convertwebm='for f in *.webm; do GetInfo;ffmpeg -i "$f" -ab ${bitrate}k "${f%.webm}.mp3"; done'
alias convertm4a='for f in *.m4a; do GetInfo;ffmpeg -i "$f" -ab ${bitrate}k "${f%.aac}.mp3"; done'

alias watchBBC1='~/iplayer/get_iplayer-2.93/get_iplayer --stream --type=livetv "BBC One" --player="mplayer -cache 512 -"'
alias watchBBC2='~/iplayer/get_iplayer-2.93/get_iplayer --stream --type=livetv "BBC Two" --player="mplayer -cache 512 -"'
alias watchBBC4='~/iplayer/get_iplayer-2.93/get_iplayer --stream --type=livetv "BBC Four" --player="mplayer -cache 512 -"'
alias changes='sed -n "/^start$/,+1p;/^first$/,+1p;/^param/,+1p;/Result/,+1p" tune[0-9]|tr '\'' '\'' '\'','\'''
alias daysto='echo "`date +%s -d 10/13/2016` `date +%s`" | awk '\''{print int(1+($1-$2)/3600/24)}'\'''
alias daystog='echo "`date +%s -d $day` `date +%s`" | awk '\''{print int(1+($1-$2)/3600/24)}'\'''
alias convertm4a='for f in *.m4a;do if ! [ -f ${f%.m4a}.mp3 ]; then rate=`mediainfo $f| awk '\''/Bit rate/{print $4}'\''|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -ab ${rate}k "${f%.m4a}.mp3";fi; done'
alias convertaac='for f in *.aac;do if ! [ -f ${f%.aac}.mp3 ]; then rate=`mediainfo $f| awk '\''/Bit rate/{print $4}'\''|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -ab ${rate}k "${f%.aac}.mp3";fi; done'
alias ttime='date +%T'
alias compcheck='awk -F '\'','\'' '\''BEGIN{aa=0;b=0}/_/{c=$31;printf("'%'20s '%'f '%'f\n", $2, c, $NF);aa+=$NF*c;b+=$NF}END{print " ";printf("'%'20s '%'f\n", "Weighted sum",aa);printf("'%'20s '%'8s '%'f\n","Total"," ",b)}'\'' /SDrive/Colin/ghc_user_a_OptimserTrace.log'
alias removemp3='for i in *.mp3; do if ! [ -f ${i%.mp3}.m4a ]; then echo $i; rm $i;fi; done'
alias sainsadd='awk -F '\''\t'\'' '\''BEGIN {t=0}{print $5;t+=$5;}END {print t}'\'''
#alias musiccheck='systemctl -l status minidlna.service;ps -e |sed -n "/tomb/p;/mpd/p;/java/p;/mini/p"'
alias capture='avplay -f video4linux2 -framerate 30 -video_size hd720 /dev/video0'
alias capture1='avplay -f video4linux2 -framerate 30 -video_size hd720 /dev/video1'
alias takepicture='ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -ss 2 -frames 1 ~/Pictures/new.jpg'
alias musiccheck='service minidlna status;ps -e |sed -n "/tomb/p;/mpd/p;/java/p;/mini/p"'
alias keywords='sed -n "/^[a-z,A-Z]/p" |tr '\''\n'\'' '\'' '\''|sed "s/ $/\n/"'
alias checkres='sed -n "/esult/,+1p"|awk '\''/[0-9]/{n=int($1+0.5);print "\033[1;31m",$1,($1-n)/n,"\033[0;m";}'\'''
alias recordvideo='ffmpeg -f video4linux2 -framerate 30 -video_size hd720 -i /dev/video0 out.mpeg'
alias recordvideo1='ffmpeg -f video4linux2 -framerate 30 -video_size hd720 -i /dev/video1 out.mpeg'
alias editmake='for i in make*; do if grep +1z $i; then sed -i s/+1z/+11/ $i; fi; done'
alias editmaker='for i in make*; do if grep +11 $i; then sed -i s/+11/+1z/ $i; fi; done'
ifconfig > /home/pi/address.txt
alias address='sed -n "/inet a/p" address.txt'
alias less='less -R'
alias ll='ls -alF --time-style=+%d-%m-%Y\ %T'
alias la='ls -A'
alias l='ls -CF'
# Add an "alert" alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
# ~/.bash_aliases, instead of adding them here directly.
alias killpy='kill -9 `ps -u pi | sed -n "/python/s/p.*//p"`'
alias killpdf='kill -9 `ps -u pi | sed -n "/evince/s/e.*//p"`'
alias killR='kill -9 `ps -u pi | sed -n "/R/s/R.*//p"`'
alias pskill='kill -9 $(ps -ax | grep sleep | sed "s/ p.*//")'
alias killoct='kill -9 `ps -u pi | sed -n "/octave-cli/s/o.*//p"`'
alias killchrome='for i in `ps -u pi|grep chrom |sed "s/ ?.*//"`; do kill -9 $i; done'
alias killnon='kill -9 `ps -u pi | awk '\''/nonlineartune/{ print $1 }'\''`'
alias killmed='kill -9 `ps -u pi | awk '\''/mediatomb/{ print $1 }'\''`'
alias listrtn='awk -F, '\''!(/.*-.*-/)&&(NF>20) {print ($NF-$(NF-1))/$(NF-1)}'\'' fundsae'
alias secondsalive='(now=`date +%s`;me=`date --date="10/13/1955 22:45:00" +%s`;echo $now $me|awk '\''{ print $1-$2 }'\'')'
alias hourssalive='(now=`date +%s`;me=`date --date="10/13/1955 22:45:00" +%s`;echo $now $me|awk '\''{ print ($1-$2)/3600 }'\'')'
alias testsafe='(cd ~/safeqp/;export LD_LIBRARY_PATH=`pwd`;python -c "from safe import version;print version();")'
alias allkernel='dpkg -l linux-* | awk '\''/^ii/{ print $2}'\'' | grep -e [0-9] | grep -E "(image|headers)"'
alias removekernels='dpkg -l linux-* | awk '\''/^ii/{ print $2}'\'' | grep -v -e `uname -r | awk '\''BEGIN {FS="-";OFS="-"};{print $1,$2-1;}'\''`| grep -v -e `uname -r | cut -f1,2 -d"-"` | grep -e [0-9] | grep -E "(image|headers)" | xargs sudo apt-get -y purge'
alias testremovekernels='dpkg -l linux-* | awk '\''/^ii/{ print $2}'\'' | grep -v -e `uname -r | awk '\''BEGIN {FS="-";OFS="-"};{print $1,$2-1;}'\''`| grep -v -e `uname -r | cut -f1,2 -d"-"` | grep -e [0-9] | grep -E "(image|headers)" | xargs sudo apt-get --dry-run remove'
alias checkres='sed -n "/esult/,+1p"|awk '\''/[0-9]/{n=int($1+0.5);print $1,($1-n)/n;}'\'''
alias FINAL='date +%Y\ %m\ %d | awk '\'' {a=$1;b=$2;c=$3;if (b>10) a+=1;else if (b==10&&c>=13) a+=1};END{print 11"/"10"/"a}'\'''
alias convertaac='for f in *.aac; do GetInfo;ffmpeg -i "$f" -ab ${bitrate}k "${f%.aac}.mp3"; done'
alias convertwebm='for f in *.webm; do GetInfo;ffmpeg -i "$f" -ab ${bitrate}k "${f%.webm}.mp3"; done'
alias convertm4a='for f in *.m4a; do GetInfo;ffmpeg -i "$f" -ab ${bitrate}k "${f%.aac}.mp3"; done'
alias watchBBC1='~/iplayer/get_iplayer-2.93/get_iplayer --stream --type=livetv "BBC One" --player="mplayer -cache 512 -"'
alias watchBBC2='~/iplayer/get_iplayer-2.93/get_iplayer --stream --type=livetv "BBC Two" --player="mplayer -cache 512 -"'
alias watchBBC4='~/iplayer/get_iplayer-2.93/get_iplayer --stream --type=livetv "BBC Four" --player="mplayer -cache 512 -"'
alias changes='sed -n "/^start$/,+1p;/^first$/,+1p;/^param/,+1p;/Result/,+1p" tune[0-9]|tr '\'' '\'' '\'','\'''
alias daysto='echo "`date +%s -d 10/13/2016` `date +%s`" | awk '\''{print int(1+($1-$2)/3600/24)}'\'''
alias daystog='echo "`date +%s -d $day` `date +%s`" | awk '\''{print int(1+($1-$2)/3600/24)}'\'''
alias convertm4a='for f in *.m4a;do if ! [ -f ${f%.m4a}.mp3 ]; then rate=`mediainfo $f| awk '\''/Bit rate/{print $4}'\''|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -ab ${rate}k "${f%.m4a}.mp3";fi; done'
alias convertaac='for f in *.aac;do if ! [ -f ${f%.aac}.mp3 ]; then rate=`mediainfo $f| awk '\''/Bit rate/{print $4}'\''|sed -n "/[0-9]/p"`;ffmpeg -i "$f" -ab ${rate}k "${f%.aac}.mp3";fi; done'
alias ttime='date +%T'
alias compcheck='awk -F '\'','\'' '\''BEGIN{aa=0;b=0}/_/{c=$31;printf("'%'20s '%'f '%'f\n", $2, c, $NF);aa+=$NF*c;b+=$NF}END{print " ";printf("'%'20s '%'f\n", "Weighted sum",aa);printf("'%'20s '%'8s '%'f\n","Total"," ",b)}'\'' /SDrive/Colin/ghc_user_a_OptimserTrace.log'
alias removemp3='for i in *.mp3; do if ! [ -f ${i%.mp3}.m4a ]; then echo $i; rm $i;fi; done'
alias sainsadd='awk -F '\''\t'\'' '\''BEGIN {t=0}{print $5;t+=$5;}END {print t}'\'''
#alias musiccheck='systemctl -l status minidlna.service;ps -e |sed -n "/tomb/p;/mpd/p;/java/p;/mini/p"'
alias capture='avplay -f video4linux2 -framerate 30 -video_size hd720 /dev/video0'
alias capture1='avplay -f video4linux2 -framerate 30 -video_size hd720 /dev/video1'
alias takepicture='ffmpeg -f video4linux2 -s 640x480 -i /dev/video0 -ss 2 -frames 1 ~/Pictures/new.jpg'
alias musiccheck='service minidlna status;ps -e |sed -n "/tomb/p;/mpd/p;/java/p;/mini/p"'
alias keywords='sed -n "/^[a-z,A-Z]/p" |tr '\''\n'\'' '\'' '\''|sed "s/ $/\n/"'
alias checkres='sed -n "/esult/,+1p"|awk '\''/[0-9]/{n=int($1+0.5);print "\033[1;31m"$1,($1-n)/n"\033[0;m";}'\'''
alias recordvideo='ffmpeg -f video4linux2 -framerate 30 -video_size hd720 -i /dev/video0 out.mpeg'
alias recordvideo1='ffmpeg -f video4linux2 -framerate 30 -video_size hd720 -i /dev/video1 out.mpeg'
alias editmake='for i in make*; do if grep +1z $i; then sed -i s/+1z/+11/ $i; fi; done'
alias editmaker='for i in make*; do if grep +11 $i; then sed -i s/+11/+1z/ $i; fi; done'
alias less='less -R'
alias zipchanges='zip -fr backup $(diff -c base . | awk '\''/diff -c/{ print $4 }'\''|sed "s/..//;/Base/d")'
alias green='awk '\''{ print "\x1b[1;32m"$0"\x1b[0;m" }'\'''
alias leafweeks='(a=$(date +%s);b=$(date +%s --date="2020/03/03");echo  $((($a-$b)/3600/24/7)) weeks)'
alias penweeks='(a=$(date +%s);b=$(date +%s --date="2021/10/13");echo  $((($a-$b)/3600/24/7)) weeks)'
alias remtrack='python -c "for i in range(20,100): print \"mpc del %d\" %i" |bash'
alias remtrack='python -c "for i in range(20,100): print(\"mpc del %d\" %i)" |bash'
alias recordcopy='(cd ~/sound;for i in rec*.mp3; do echo $i;cp $i ~/Music/$i; mpc --wait update ;mpc add $i; done)'
