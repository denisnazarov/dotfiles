#!/bin/sh

source "${0%/*}/../script/utils"

ensure_homebrew_install

brew_install git
brew_install hub
