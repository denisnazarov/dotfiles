#!/bin/sh

# installs brews

source "${0%/*}/../utils"

if [ ! is_homebrew_installed ]; then homebrew_not_installed_message && exit; fi

# Make sure we’re using the latest Homebrew
echo "brew update..."
brew update

brew_install git
brew_install vim
brew_install hub
brew_install zsh
brew_install node
brew_install tmux
brew_install rbenv
brew_install ruby-build
brew_install mongo
brew_install redis
brew_install ec2-api-tools
brew_install zsh-completions
brew_install the_silver_searcher
brew_install reattach-to-user-namespace

brew cleanup

exit 0
