# kv-ates: a list of handy solutions.

## ansible, end playbook early:
  * use `meta` module: `- meta: end_play`

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

## general, use feh to quickly navigate svg files inside a folder:
  * `feh --conversion-timeout 1 -g 640x480 -d -S filename .`

## general, install `yay`:
  ```
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  ```
## general, configure suspend on lid close:
  * edit `/etc/systemd/logind.conf`, reboot

## general, generate random string with `openssl`:
  * `openssl rand -base64 <size>`

## general, list swap partitions:
  * `swapon -s` or `cat /proc/swaps`  

## general, compact XOR ([source](http://www.howtocreate.co.uk/xor.html)):
  * `A XOR B = NOT (NOT A == NOT B)`

## general, `xargs` delimiter flag (in case there is the possibility of having whitespace in a line):
  * `xargs -d '\n' <input>`

## general, `sort` by a given column:
  * `sort -k <column number> <input>`

## general, manually set keyboard layout/variant:
  * `setxkbmap <layout> <variant>`

## general, `timedatectl` command:
  * set system timezone: `timedatectl set-timezone Europe/Berlin`

  * list timezones: `timedatectl list-timezones`

## general, mnemonic for little and big endian ([source](https://softwareengineering.stackexchange.com/questions/142926/is-there-any-practical-trick-to-remember-the-difference-between-big-endian-and-l/294831)):
  * big endian: the large part of the number is first (big first)
    - similar to common usage: 123 = 1 * 10^2 + 2 * 10^1 + 3 * 10^0

  * little endian: the small part of the number is first (little first)
    - exponents order follows digit iteration order, so 123 is 321 in LE: 321 = 3 * 10^0 + 2 * 10^1 + 3 * 10^2 

## general, `watch` command:
  * `-n` flag defines time interval: `watch -n 2 nmcli`

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

## JavaScript, difference between `isNaN` and `Number.isNaN`:
  * `isNaN` attempts to convert the value to a number and then checks whether
    the result equals `NaN`;

  * `Number.isNaN` checks whether the input is exactly `NaN` (without conversion);

  ```
  Number.isNaN(void 0) === false

  isNaN(void 0) === true
  ```

## JavaScript, difference between `isFinite` and `Number.isFinite`:
  * `isFinite` attempts to convert the value to a number and then checks whether
    it is finite;

  * `Number.isFinite` performs the check without conversion;

## Jest/Enzyme, wait for async calls/promise resolution before proceeding with test:
  * when using Enzyme `mount`, async calls in or triggered by lifecycle methods (such as `componentDidMount`) 
    will not be waited for, even if remote calls are stubbed/mocked using `jest.fn().mockResolvedValue` or the like.
    (does not mean that they will not be resolved, but they may end up resolving at a later time than expected)
   

  * to make sure that pending promises are executed after calling 'mount', use `setImmediate`:
  ```
  test('Foo does a network request on componentDidMount', async () => {
      const component = mount(<Foo />);

      // if you do not use this line, the assertion below may (and probably will) fail
      await new Promise(res => setImmediate(res));

      expect(fetch).toHaveBeenCalled();
  })
  
  ``` 

## git, show diff without header and add context:
  * `git diff --no-prefix -U1000 HEAD^ HEAD` 

## git, reference to nth last commit:
  * `git diff HEAD~n HEAD`

## git, pull and init submodules:
  * `git submodule update --init --recursive`

## git, log without pager:
  * `git --no-pager log > log.txt`

## git, exclude files matching a certain pattern from diff ([stackoverflow](https://stackoverflow.com/a/29374503)):
  * `git diff --cached -- . ':!spec'`

## git, list url for origin:
  * `git remote get-url <origin name>`

## git, caveat regarding --depth
  * if `--depth` is set, pulling from remote does **nothing**.

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

  * checkboxes: `- [ ] Foo bar`

  * more help: https://www.markdownguide.org/basic-syntax

## Postman, generate values:
  * uuid: `{{$guid()}}`
  * defining custom keywords:
  ```
  // in the pre-request script section:
  pm.globals.set('randomNumber', Math.floor(Math.random() * 5));

  // in the request body:
  {{randomNumber}}
  ```
     

## http, difference between PUT and PATCH:
  _I know, I know, I should know this, but I always get which is which wrong..._

  * PUT is a full-entity replacement of an existing entity. Idempotent.

  * PATCH is a partial update of an existing entity. NOT idempotent.

## virtualbox, mounting physical drive:
  ```
  vboxmanage internalcommands createrawvmdk -filename $HOME/win10.vmdk -rawdisk /dev/sdb
  ```

## sed, delete empty lines:
  * `sed '/^$/d'` (delete mode on sed with `d`)

## ssh, remember ssh key auth for a terminal session:
  * `eval $(ssh-agent) && ssh-add`

## ssh, show visual keys representation when connecting with ssh:
  * use `VisualHostKey yes` in `/etc/ssh/sshd_config`

## ssh, local port forwarding:
  * `ssh <server user>@<server host> -L <address in local host>:<address in remote server> -N`

  * the `-N` flag makes it so that a shell is not opened

## xrandr, set resolution and refresh rate in the same command:
  * `xrandr --output <output name> --mode <resolution> --rate <refresh rate>` 

## postgres, local host access
  * change postgres config to allow any host access (if accessing from docker)
  * add user/db/pwd as necessary
  * change pg_hba to allow access as that user to the db
