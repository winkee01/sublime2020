#!/bin/bash

####
# this is the script used to be called by Sublime Text build system
# {
#   "cmd": ["./rsync_build.sh", "tolocal", "$file_path"],
#   "working_dir": "$file_path"
# }
#
####

# server ip
USER=xxx
REMOTE_IP=x.x.x.x
SERVER=$USER@$REMOTE_IP
REMOTE_DIR_PREFIX=./sc
LOCAL_PATH_FULL=''

# $1 is the project dir
toremote() {
    if [ -z "$1" ]; then
        echo "Missing folder name argument."
    else
        RSYNC_TO="$SERVER:$REMOTE_DIR_PREFIX/$1"
        echo "Syncing from $(pwd) to $RSYNC_TO"
        #rsync -avz --delete --exclude '.git' -e ssh ./$1/ $RSYNC_TO
        rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/id_rsa" \
        --exclude=".git" --exclude=data --progress ./* $RSYNC_TO
    fi
}

tolocal() {
    if [ -z "$1" ]; then
        echo "Missing folder name argument."
    else
        RSYNC_FROM="$SERVER:$REMOTE_DIR_PREFIX/$1"
        echo "Syncing from $RSYNC_FROM to $LOCAL_PATH_FULL"
        rsync -avz -e "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -i ~/.ssh/id_rsa" \
        --exclude={'.git','data'} --progress $RSYNC_FROM .
    fi
}

main() {
    echo $1
    echo "current dir: "$2
    LOCAL_PATH_FULL=$2
    current_dir=${LOCAL_PATH_FULL##*/}

    [[ $1 == "toremote" ]] && echo "sync to remote ...."; toremote $current_dir
    # [[ $1 == "tolocal" ]] && tolocal $2
}

main $@