#!/bin/bash
cmus-remote -C clear
cmus-remote -C "add ~/Documents/Nextcloud/Music"
cmus-remote -C "update-cache -f"
