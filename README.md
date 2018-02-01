# Nick's Dotfiles

These are my dotfiles. Take anything you like, but use at your own risk.

## Installation

On a fresh installation of macOS:

    sudo softwareupdate -i -a
    xcode-select --install

### Clone with Git

    git clone https://github.com/nickfairchild/dotfiles.git ~/.dotfiles
    source ~/.dotfiles/install.sh

## The `dotfiles` command

    $ dotfiles help
    Usage: dotfiles <command>

    Commands:
      clean            Clean up caches (brew, npm, composer)
      help             This help message
      macos            Apply macOS system defaults
      link             Symlink dotfiles
      brew             Setup homebrew
      composer         Setup composer
      update           Update packages and pkg managers (OS, brew, npm, composer)

## Credits

dotfiles script is a modified version from [webpro dotfiles](https://github.com/webpro/dotfiles)
