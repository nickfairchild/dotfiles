#!/usr/bin/env bash

echo "\nUpdate Mac system\n"
sudo softwareupdate -i -a

echo "\nUpdate Brew Packages\n"
brew update
echo "\nUpgrade Brew Packages\n"
brew upgrade
echo "\nBrew Doctor\n"
brew doctor
echo "\nCleanup Brew Packages\n"
brew cleanup

echo "\nBrew Cask Doctor\n"
brew cask doctor
echo "\nUpgrade Brew Cask Packages\n"
brew cask upgrade
echo "\nCleanup Brew Cask Packages\n"
brew cask cleanup

echo "\nUpdate Composer\n"
composer self-update
echo "\nUpdate Global Composer Packages\n"
composer global update

echo "\nUpdate npm\n"
npm i -g npm
echo "\nUpdate Global npm Packages\n"
npm update -g
