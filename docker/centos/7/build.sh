#!/usr/bin/env bash

cd /yowsup

if [[ $? -ne 0 ]]; then
  echo "Umounted /yowsup"
  exit 1
fi

DEST=${DEST:-/amb/local/whatsapp}

virtualenv --no-pip $DEST
source $DEST/bin/activate
python setup.py install
tar czvf /yowsup/docker/centos/7/whatsapp.tgz $DEST
