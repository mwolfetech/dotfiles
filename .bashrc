export EDITOR=vim
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

#when in git repos, change prompt to show branch name and whether branch is dirty
if [[ -n $PS1 ]] ; then
  export PS1='\h:\W$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]]")$ '
fi

alias mv='mv -i'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias gr='grep -rni --color'
alias pi='ls -la | grep'
alias psa='ps aux | grep'
alias pst='pstree -hAcpul'

#private/local settings
source $HOME/.bashrc_local

#rvm = ruby version manager.  Awesome.
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm 
