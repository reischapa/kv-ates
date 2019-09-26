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

## general, install `yay`:
```
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
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
    * fzf
    * autojump
    * rofi
    * polybar
    * ~~vim~~ nope, gvim due to clipboard integration
    * python
    * node
    * mobile-broadband-provider, modemmanager (3g, if not installed by installer)
    * thunar/nautilus (makes usb drives so much easier)
    * nm-connection-editor
    * ttf-ms-fonts (for helvetica and other "default" ms fonts)
    * blueman (check if blueman-pulseaudio gets installed)
    * pulseaudio

## general, configure suspend on lid close:
  * edit `/etc/systemd/logind.conf`, reboot

## general, generate random string with `openssl`:
  * `openssl rand -base64 <size>`

## general, list swap partitions:
  * `swapon -s` or `cat /proc/swaps`  

## general, compact XOR ([source](http://www.howtocreate.co.uk/xor.html)):
  * `A XOR B = NOT (NOT A == NOT B)`

## autojump, script: 
  * ~~autojump on arch needs a symlink from the .bash to .sh~~ nope, solved on .bashrc

## css, the three same differences:
  * `.class1 .class2`: means inside
  * `.class1.class2`: means needs to have both
  * `.class1, .class2`: means has one or the other

## css, icons that pull events into the void:
  * `<i>` elements (at least, those that have FontAwesome classes) need to have 
    `pointer-events: none;` in their CSS in order to allow clicks to pass through to other
    elements behind them

## webpack (2, not sure about other versions), ignore files in  watch mode:
  * Use watchIgnorePlugin, NEEDS ABSOLUTE PATHS TO WORK (could not get it to work otherwise).

## npm, glob package:
  * needs special option to return full paths
  * needs to have symlinks flagged as such in order to follow them

## npm, which logger?:
  * `debug`, `winston`, `log4js` (order of popularity 2k18)

## npm, input parser:
  * `commander.js`:
  ```
  const program = require('commander');
  program.option('-d, --debug', 'extra debugging'); //etc
  program.parse(process.argv);
  ```

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

## JavaScript, what the...:
  * in browsers, any global variable called `name` declared in the global scope is INVARIABLY treated as 
    if it is a string (credit to [@joaosamouco](https://github.com/joaosamouco)
    and [@joaopintomfc](https://github.com/joaopintomfc)):

    ```
    var name = () => 1;
    console.log(typeof name) // "string"
    ```

## JavaScript, check if value is numeric ([SO answer](https://stackoverflow.com/a/9716488)):
  * `const isNumeric = n => !isNaN(parseFloat(n)) && isFinite(n);` (kinda oldschool, but works)

## git, show diff without header and add context:
  * `git diff --no-prefix -U1000 HEAD^ HEAD` 

## git, reference to nth last commit:
  * `git diff HEAD~n HEAD`

## grub, recover from command line:
  ```
  set pager=1
  ls
  set root=(hd?,?)
  linux <stuff> root=/dev/sdX
  initrd <stuff>
  boot
  ```

## grub, grub-install:
  * `--efi-directory` option takes the folder that CONTAINS the efi directory, not the efi directory path itself

## node.js, `path.normalize` vs `path.resolve` ([SO answer](https://stackoverflow.com/a/10823859)):
  _"Ironically, this means that path.resolve() produces a relative path in
  absolute terms (you could execute it anywhere, and it would produce the same
  result), whereas path.normalize() produces an absolute path in relative terms
  (you must execute it in the path relative to which you want to calculate the
  absolute result)."_

  * Meaning, `path.resolve(__dirname, <relativePath>)` results in an absolute
  filepath, since `__dirname` is always absolute.

  * To get an absolute filepath from `resolve`, we would then pass it to
  `normalize`: `path.normalize(path.resolve('home/foo', 'bar'))` results in
  `${process.cwd}/home/foo/bar`

## npm, express package, default error handler middleware signature:
  * `(err, req, res, next) => {/*something*/}`

## npm, express package, set response headers:
  * `res.set(<header name>, <header value>)`

## npm, express package, correct CORS headers:
  * required in all methods, but when in OPTIONS middleware, return 200 and send
    immediately instead of calling `next`.

## npm, express package, use middleware on all routes:
  * `app.use('*', <middleware>);`

## npm, ajv package, custom validator:
  * use `ajv.addKeyword(<keyword>, <descriptor>)`

  * if you define a `type` in the descriptor that is passed to `addKeyword`, then
    the validator only tries to apply that validator to a value of that type
    (!!!!)

## markdown, syntax:
  * links: `[]()` (square then round)

  * more help: https://www.markdownguide.org/basic-syntax

## http, difference between PUT and PATCH:
  _I know, I know, I should know this, but I always get which is which wrong..._

  * PUT is a full-entity replacement of an existing entity. Idempotent.

  * PATCH is a partial update of an existing entity. NOT idempotent.
