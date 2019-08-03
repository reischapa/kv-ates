#!/usr/bin/env bash

if [ ! -d /home/chapa/kv-ates ]; then
  echo "kv-ates repository not found! Exiting...."
  exit 1;
fi

cd /home/chapa/kv-ates/viewer;

if [ ! -d node_modules ]; then
  npm i;
fi

./node_modules/.bin/nodemon -e "js,css,html,md" --exclude "/home/chapa/kv-ates/node_modules/" --watch "/home/chapa/kv-ates/**/" --exec "node index.js"
