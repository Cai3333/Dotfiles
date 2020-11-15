#! /bin/bash 
nitrogen --restore &
picom &
nm-applet &
volumeicon &
clipit &
pamac-tray &
alttab &
xautolock -time 60 -locker blurlock &
redshift-gtk &
syncthing &
rclone --vfs-cache-mode writes mount onedrive: ~/onedrive &
