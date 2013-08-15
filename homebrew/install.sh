#!/bin/sh

source "${0%/*}/../script/utils"

ensure_homebrew_install

# Make sure we’re using the latest Homebrew
log_info "brew update..."
brew update

brew_install ec2-api-tools
brew_install the_silver_searcher
brew_install graphicsmagick
brew_install imagemagick

brew cleanup

exit 0
