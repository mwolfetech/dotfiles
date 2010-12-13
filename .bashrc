export EDITOR=vim
set -o vi

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

if [[ -n $PS1 ]] ; then
  export PS1='\h:\W$(__git_ps1 "[\[\e[0;32m\]%s\[\e[0m\]\[\e[0;33m\]$(parse_git_dirty)\[\e[0m\]]")$ '
fi
_rc()
{
    local cur prev opts base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    local names=$( find /etc/rc.d/ \( -name . -prune \) -o -type f -perm /o+x -printf "%P\n" )
    COMPREPLY=( $(compgen -W "${names}" -- ${cur}) )
    return 0
}


function rc {
  sudo /etc/rc.d/$1 restart
}

complete -F _rc rc

function restart_vpnc {
  sudo vpnc-disconnect
  sudo nscd -i hosts
  sleep 1
  sudo dhcpcd -k eth0
  sleep 1
  sudo /etc/rc.d/network restart
  sleep 1
  sudo dhcpcd -n eth0
  sleep 2
  sudo vpnc
}



alias mv='mv -i'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias gr='grep -rni --color'
alias pi='ls -la | grep'
alias psa='ps aux | grep'
alias pst='pstree -hGcpul'

alias nrv=restart_vpnc

source $HOME/.bashrc_local
export JSDOCDIR=$HOME/jsdoc-toolkit
export JSDOCTEMPLATEDIR=$JSDOCDIR


[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm
