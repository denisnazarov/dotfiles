if [ "$SHELL" != '/bin/zsh' ]; then chsh -s /bin/zsh; fi

ANTIGEN_PATH=./zsh/zsh.symlink/antigen

if [ -d "$ANTIGEN_PATH" ]; then
  echo 'TODO: pull antigen latest'
else
  git submodule add https://github.com/zsh-users/antigen.git "$ANTIGEN_PATH"
fi
