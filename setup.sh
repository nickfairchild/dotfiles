#!/usr/bin/env bash

export DOTFILES_DIR
DOTFILES_DIR="$HOME/.dotfiles"

PATH="$DOTFILES_DIR/bin:$PATH"

echo "Installing Xcode command line tools ..."
sudo softwareupdate -i -a
xcode-select --install

echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "You can now run the 'dotfiles' command."
