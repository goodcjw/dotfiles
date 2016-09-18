#!/bin/bash

function salt_dryrun() {
  sudo salt-call --local state.highstate \
                 --config-dir ./salt_conf \
                 --file-root ./salt_root \
                 test=$1
}

function salt_apply() {
  sudo salt-call --local state.highstate \
                 --config-dir ./salt_conf \
                 --file-root ./salt_root
}

hostname > ./salt_conf/minion_id
salt_dryrun

while true; do
  read -p "Do you wish to apply there changes?" ans
  case $ans in
    [Yy]* ) salt_apply; break;;
    [Nn]* ) exit;;
    * ) echo "Please answer yes or no.";;
  esac
done
