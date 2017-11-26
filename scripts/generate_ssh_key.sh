#!/bin/bash

echo "############################################################"
echo "#                   generate_ssh_key.sh                    #"
echo "############################################################"

echo "[generate_ssh_key] Enter comment for this key (don't fuck it up): "
read COMMENT

echo "[generate_ssh_key] You usually fuck this up, second chance? (hit enter to skip): "
read YOU_FUCKED_IT_UP

[ ! -z $YOU_FUCKED_IT_UP ] && COMMENT=$YOU_FUCKED_IT_UP

ssh-keygen -t rsa -b 4096 -C "${COMMENT}"
