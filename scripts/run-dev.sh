#!/usr/bin/env bash

if [ ! -d "$HOME/kv-ates" ]; then
  echo "kv-ates repository not found! Exiting...."
  exit 1;
fi

cd "$HOME/kv-ates";

if [ ! -d node_modules ]; then
  npm i;
fi

./node_modules/.bin/a6e README.md

