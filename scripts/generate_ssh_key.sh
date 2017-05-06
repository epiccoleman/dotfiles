#!/bin/bash

echo "############################################################"
echo "#                   generate_ssh_key.sh                    #"
echo "############################################################"

echo "[generate_ssh_key] Enter comment for this key (don't fuck it up): " 
read COMMENT

ssh-keygen -t rsa -b 4096 -C "${COMMENT}"
