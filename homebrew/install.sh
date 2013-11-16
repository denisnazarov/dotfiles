#!/bin/sh

source "${0%/*}/../script/utils"

ensure_homebrew_install

# Make sure we’re using the latest Homebrew
log_info "brew update..."
brew update

brew_install heroku-toolbelt
brew_install ec2-api-tools
brew_install the_silver_searcher
brew_install graphicsmagick
brew_install imagemagick
brew_install ctags-exuberant
brew_install youtube-dl
brew_install wget
brew_install ffmpeg
brew_install vim
brew_install tmux
brew_install rbenv
brew_install ruby-build

brew cleanup

exit 0
