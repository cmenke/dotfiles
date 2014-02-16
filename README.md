# Dotfiles

My OS X / Ubuntu dotfiles (based on [github.com/cowboy/dotfiles](https://github.com/cowboy/dotfiles)).

* OS/DIST-centered init scripts
* easy to maintain (e.g. reintrating changes)


## Installation

Simply clone/download the repository and run [bin/dotfiles][dotfiles].

```sh
git clone https://github.com/cmenke/dotfiles.git ~/.dotfiles
~/.dotfiles/bin/dotfiles [--no-init] [--cask]
```

### OS X Notes

* You need to have installed [XCode](https://developer.apple.com/downloads/index.action?=xcode) or, at the very minimum, the [XCode Command Line Tools](https://developer.apple.com/downloads/index.action?=command%20line%20tools), which are available as a _much smaller_ download thank XCode.
* You need to be an administrator (for `sudo`), unless you skip the init step.

### Ubuntu Notes

* You need to be an administrator (for `sudo`) to run the init step*

*In my case, debian/ubuntu systems are usually provisioned via [saltstack](https://github.com/saltstack/salt) or [puppet](https://github.com/puppetlabs/puppet), thus there's minimal to no need to perform the init step (`--no-init`)


## What, exactly, does the "dotfiles" command do?

It's really not very complicated. When [dotfiles][dotfiles] is run, it does a few things:

1. Git is installed if necessary, via APT or Homebrew (which is installed if necessary).
2. This repo is cloned into the `~/.dotfiles` directory (or updated if it already exists).
3. Files in `init` are executed* (in alphanumeric order, hence the "50_" names)
4. Files in `copy` are copied into `~/`.
5. Files in `link` are linked into `~/`.

*unless an `--no-init` flag is passed.

Note:

* The `backups` folder only gets created when necessary. Any files in `~/` that would have been overwritten by `copy` or `link` get backed up there.
* Files in `bin` are executable shell scripts (Eg. [~/.dotfiles/bin][bin] is added into the path).
* Files in `conf` just sit there. If a config file doesn't _need_ to go in `~/`, put it in there.
* Files in `caches` are cached files, only used by some scripts. This folder will only be created if necessary.

[dotfiles]: bin/dotfiles
[bin]: bin

## The "init" step
A whole bunch of things will be installed, but _only_ if they aren't already. You may skip this step by using the `--no-init` flag -- consequently, no `sudo` rights will be required.

OS / Distribution dependant Installation Scripts are localted in `init/$OS` (see [10_os.sh](init/10_os.sh))

### OS X

* A bunch of [system defaults][osx_system] and [user tweaks][osx_user] are run
* Homebrew recipes (see [Brewfile][brewfile]) are installed
* Regular OS X Applications are installed via [brew cask][osx_cask] if the `--cask` flag is set

[osx_system]: init/osx/10_system_defaults.sh
[osx_user]: init/osx/20_user_defaults.sh
[osx_cask]: init/osx/45_packages-cask.sh
[brewfile]: conf/osx/Brewfile

### Ubuntu
* The following APT Packages will be installed
  * build-essential
  * libssl-dev
  * rbenv
  * tree
  * nmap
  * telnet
  * htop
  * ngrep

### Both
* [oh-my-zsh](#oh-my-zsh) is installed

## The ~/ "copy" step
Any file in the `copy` subdirectory will be copied into `~/`. Any file that _needs_ to be modified with personal information (like [.gitconfig](copy/.gitconfig) which contains an email address and private key) should be _copied_ into `~/`. Because the file you'll be editing is no longer in `~/.dotfiles`, it's less likely to be accidentally committed into your public dotfiles repo.

## The ~/ "link" step
Any file in the `link` subdirectory gets symbolically linked with `ln -s` into `~/`. Edit these, and you change the file in the repo. Don't link files containing sensitive data, or you might accidentally commit that data!

<a name="oh-my-zsh"></a>
## oh-my-zsh: Aliases, Functions and Plugins
By default, [~/.oh-my-zsh.d](link/.oh-my-zsh.d) is set as `ZSH_CUSTOM` in [~/.zshrc](link/.zshrc).

## License
Copyright (c) 2014 Ben Alman, Christoph Menke<br>
Licensed under the [MIT license](http://opensource.org/licenses/MIT/)
