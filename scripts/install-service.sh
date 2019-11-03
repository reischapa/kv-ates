#!/usr/bin/env bash

mkdir -pv $HOME/.local/share/systemd/user;

rm -vf $HOME/.local/share/systemd/user/kv-ates.service;
cp -v scripts/kv-ates.service $HOME/.local/share/systemd/user/kv-ates.service;

systemctl --user enable kv-ates.service;
systemctl --user daemon-reload;
systemctl --user start kv-ates.service;
