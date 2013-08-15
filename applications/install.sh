#!/bin/sh

source "${0%/*}/../script/utils"

if [ ! is_homebrew_installed ]; then homebrew_not_installed_message && exit; fi

if ! brew_is_installed brew-cask; then
  brew tap phinze/homebrew-cask
  brew_install brew-cask
fi

brew_cask_install dropbox
brew_cask_install google-chrome
brew_cask_install google-chrome-canary
brew_cask_install the-unarchiver
brew_cask_install iterm2
brew_cask_install vlc
brew_cask_install divvy
brew_cask_install evernote
brew_cask_install firefox

