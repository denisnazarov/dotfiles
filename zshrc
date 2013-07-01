# path to oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

export EDITOR=vim

# set name of the theme to load
ZSH_THEME="moudy"

# more completions!
fpath=(/usr/local/share/zsh-completions $fpath)

# plugins
plugins=(history-substring-search osx hub git heroku brew gem npm zsh-syntax-highlighting)

# source these
source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.aws
source "`brew --prefix`/etc/grc.bashrc"

# alias hub to git
eval "$(hub alias -s)"

# speed things up
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

__git_files () {
  _wanted files expl 'local files' _files
}

# setup Amazon EC2 command-line tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

# add my path
PATH=$HOME/bin:$PATH

# look for homebrew versions first
PATH=/usr/local/bin:$PATH

# rbevn
PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# make paths unique
PATH=`paths | awk ' !x[$0]++' | tr '\n' : | sed 's/:$//'`

# fixes TMUX window rename bug
# http://superuser.com/questions/306028/tmux-and-zsh-custom-prompt-bug-with-window-name
DISABLE_AUTO_TITLE=true

# don't correct me
unsetopt correct_all

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator ]]

