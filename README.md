## virtualbox, mounting physical drive:
```
vboxmanage internalcommands createrawvmdk -filename $HOME/win10.vmdk -rawdisk /dev/sdb
```

## lightdm, testing mode: 
```
lightdm --test-mode
```

## systemd, add service: 
```
sudo vim /etc/systemd/system/<serviceName>.conf
sudo systemctl daemon-reload
sudo systemctl <serviceName> enable
sudo systemctl <serviceName> start 
```


## general, needed programs: 
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

## autojump, script: 
  * ~~autojump on arch needs a symlink from the .bash to .sh~~ nope, solved on .bashrc

## css, the three same differences:
  * `.class1 .class2`: means inside
  * `.class1.class2`: means needs to have both
  * `.class1, .class2`: means has one or the other

## sebpack (2, not sure about other versions), ignore files in  watch mode:
  * Use watchIgnorePlugin, NEEDS ABSOLUTE PATHS TO WORK (could not get it to work otherwise).

## npm, glob package:
  * needs special option to return full paths
  * needs to have symlinks flagged as such in order to follow them

## mount, check if dir is mountpoint:
  * `findmnt -M`, `-J` flag outputs json for `jq`

## shell/Bash, syntax:
  * single brakets need spaces between next characters

## shell/Bash, conditional flags:
  * `-f`: exists file
  * `-z`: string with zero length
  * `-n`: string with non-zero length
  * `-d`: exists dir

## shell/Bash, negate condition:
  * `[ ! -f filename ]`, for instance

## shell/Bash, single line `while`:
  * `while true; do foo; sleep 2; done;`
