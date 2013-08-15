PROMPT='%{$fg[cyan]%}%c$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}'

# prompt with ruby version
# # rbenv version | sed -e 's/ .*//'
__rbenv_ps1 ()
{
  rbenv_ruby_version=`rbenv version | sed -e 's/ .*//'`
  printf "ruby:$rbenv_ruby_version"
}

function stoppedjobs() {
  local num=`jobs -s | wc -l | sed -e "s/ //g"`
  if [ "$num" -eq "0" ]; then;
  elif [ "$num" -eq "1" ]; then;
    echo "$num bg job"
  else
    echo "$num bg jobs"
  fi
}

RPROMPT='$(__rbenv_ps1) %{$fg[cyan]%}$(stoppedjobs)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}:%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✓"
