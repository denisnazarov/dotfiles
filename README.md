## Dotfiles
My dotfiles, heavily inspired by [Zach Holman's dotfiles](https://github.com/holman/dotfiles).

### Install
```sh
git clone https://github.com/moudy/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/link
```

### Usage
`dot link` will symlink any file with the `.symlink` suffix to your home directory

```sh
dot link
.vimrc -> /Users/moudy/.dotfiles/vim/vimrc.symink
```

