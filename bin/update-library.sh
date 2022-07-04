#!/bin/bash
cmus-remote -C clear
cmus-remote -C "add ~/Documents/Nextcloud/music"
cmus-remote -C "update-cache -f"
