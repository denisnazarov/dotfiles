# path to oh-my-zsh configuration
ZSH=$HOME/.oh-my-zsh

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
source $HOME/.work
source "`brew --prefix`/etc/grc.bashrc"

# alias hub to git
eval "$(hub alias -s)"

# rbevn
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"

# add node to path
PATH=/usr/local/share/npm/bin:$PATH

# add my path
PATH=$HOME/bin:$PATH

# look for homebrew versions first
PATH=/usr/local/bin:$PATH

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

# let ruby take upi more memory
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# don't correct me
unsetopt correct_all

