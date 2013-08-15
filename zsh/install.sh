#!/bin/sh

source "${0%/*}/../script/utils"

if [ "$SHELL" != '/bin/zsh' ]; then chsh -s /bin/zsh; fi

ensure_homebrew_install

brew_install zsh
brew_install zsh-completions
