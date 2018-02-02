#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names

# Install `wget`.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install python3

brew tap homebrew/php
brew install php71 --with-gmp
brew install composer

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install other useful binaries.
brew install git
brew install git-lfs
brew install imagemagick --with-webp
brew install lua
brew install mariadb
brew install node
brew install php-cs-fixer
brew install ssh-copy-id
brew install tree
brew install yarn

# Install casks
brew tap caskroom/cask
brew cask install google-chrome
brew cask install 1password
brew cask install adobe-creative-cloud
brew cask install cleanmymac
brew cask install jetbrains-toolbox
brew cask install iterm2
brew cask install alfred
brew cask install spotify
brew cask install postman
brew cask install skype
brew cask install tower
brew cask install sourcetree
brew cask install sublime-text
brew cask install firefox
brew cask install visual-studio-code
brew cask install sequel-pro

brew tap caskroom/fonts
brew cask install font-fira-code
brew cask install font-source-code-pro
brew cask install font-source-sans-pro
brew cask install font-source-serif-pro

# Remove outdated versions from the cellar.
brew cleanup
brew cask cleanup

# Install zsh and oh-my-zsh
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
