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

## Autojump, script: 
* ~~autojump on arch needs a symlink from the .bash to .sh~~
  * nope, solved on .bashrc

## CSS, the three same differences:
  * `.class1 .class2`: means inside
  * `.class1.class2`: means needs to have both
  * `.class1, .class2`: means has one or the other

## Webpack (2 for sure, not sure about other versions), Ignore files in  watch mode:
  * Use watchIgnorePlugin, NEEDS ABSOLUTE PATHS TO WORK (could not get it to work otherwise).

## mount, Check if dir is mountpoint:
  * `findmnt -M`, `-J` flag outputs json for `jq`

## Shell/Bash, conditional flags:
  * `-f`: exists file
  * `-z`: string with zero length
  * `-n`: string with non-zero length

## Shell/Bash, single line `while`:
  * `while true; do foo; sleep 2; done;`
