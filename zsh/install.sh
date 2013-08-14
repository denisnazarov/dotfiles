if [ "$SHELL" != '/bin/zsh' ]; then chsh -s /bin/zsh; fi

git submodule foreach git pull origin master
