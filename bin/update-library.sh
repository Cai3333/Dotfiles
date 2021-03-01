#!/bin/bash
cmus-remote -C clear
cmus-remote -C "add ~/Syncthing/Music"
cmus-remote -C "update-cache -f"
