## Mounting physical drive in virtualbox
```
vboxmanage internalcommands createrawvmdk -filename $HOME/win10.vmdk -rawdisk /dev/sdb
```

## Testing greeter
```
lightdm --test-mode
```

## Adding a service in systemd
```
sudo vim /etc/systemd/system/<serviceName>.conf
sudo systemctl daemon-reload
sudo systemctl <serviceName> enable
sudo systemctl <serviceName> start 
```

## Notes

* ~~autojump on arch needs a symlink from the .bash to .sh~~
  * nope, solved on .bashrc

## Needed programs

* npm:
  * npx
  * nodemon
  * n (don't forget to setup so that changes do not need sudo)
  * babel-cli
  * prettier
  * lerna
  * webpack

* others:
  * lxterminal
  * realtek driver (depends on hardware)
  * yay
  * ssh
  * keepass
  * jq
  * pulsemixer
  * feh
  * compton
  * .git-bash
  * autojump
  * rofi
  * polybar
  * ~~vim~~ nope, gvim due to clipboard integration
  * python
  * node
  * mobile-broadband-provider, modemmanager (3g, if not installed by installer)
  * thunar/nautilus (makes usb drives so much easier)
