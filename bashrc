# Path Settings

# Personal code path
export PATH=~/bin:$PATH

# MacPorts
if [ "$(uname)" == "Darwin" ]
then
   PATH=/opt/local/bin:/opt/local/sbin:$PATH:/opt/local/libexec/gnubin
   JAVA_HOME=$(/usr/libexec/java_home)
   MANPATH=/opt/local/share/man:$MANPATH
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"

# Aliases

alias reload='source ~/.bashrc'
alias logotu='logout'
if [ "$(uname)" == "Darwin" ]
then
   alias ls='gls --color=auto'
else
   alias ls='ls --color=auto'
fi

# Other Settings

HISTCONTROL=ignoredups
EDITOR=vim
homedir='${PWD/#$HOME/"~"}'
PS1PATH='$(echo '$homedir' | awk -F "/" \
   '"'"'{if (length($0)>15) { if (NF>4) print $1 "/" $2 \
   "/.../" $(NF-1) "/" $NF; else if (NF>3) print $1 "/" \
   $2 "/.../" $NF; else print $1 "/" $2 "/" $NF; } \
   else print $0;}'"'"')'
unset homedir

create_ps1() {
   local owned_processes='\[\033[0;31m\]$(if [ $(echo \j) -ne 0 ]; then echo "[\j] "; fi)'

   local host=""
   if [ -n "$SSH_CLIENT" ]
   then
      host='\[\033[01;34m\]@\[\033[01;32m\]\H'
   fi
   local user='\[\033[01;32m\]\u'
   local current_location='\[\033[00m\]:\[\033[01;34m\]$(eval "echo ${PS1PATH}")\[\033[00m\]'

   echo ${owned_processes}${user}${host}${current_location}' \$ '
}
PS1=$(create_ps1)
unset create_ps1

eval `dircolors $( dirname ${BASH_SOURCE[0]})/dir_colors`

# extended patterns! Look at all the regular expressions we can use!
shopt -s extglob

# -- Improved X11 forwarding through GNU Screen (or tmux).
# If not in screen or tmux, update the DISPLAY cache.
# If we are, update the value of DISPLAY to be that in the cache.
update_x11_forwarding() {
  if [ -z "$STY" -a -z "$TMUX" ]
  then
    echo $DISPLAY > ~/.display.txt
  else
    export DISPLAY=`cat ~/.display.txt`
  fi
}

preexec() {
  # Don't cause a preexec for PROMPT_COMMAND.
  # Beware!  This fails if PROMPT_COMMAND is a string containing more than one command.
  [ "$BASH_COMMAND" = "$PROMPT_COMMAND" ] && return 

  update_x11_forwarding

  # Debugging.
  #echo DISPLAY = $DISPLAY, display.txt = `cat ~/.display.txt`, STY = $STY, TMUX = $TMUX  
}

trap 'preexec' DEBUG


# Functions

# enter tmux if it exists and this isn't already a tmux session or an SSH client
start_or_attach_tmux() {
  if [ -z "$TMUX" -a -z "$SSH_CLIENT" -a -n "$(which tmux)" ]
  then
    tmux new -A -s Shell && exit 0
  fi
}

# who needs cd ../../ ?
up() {
   local d=""
   limit=$1
   for ((i=1 ; i <= limit ; i++))
      do
         d=$d/..
      done
   d=$(echo $d | sed 's/^\///')
   if [ -z "$d" ]; then
      d=..
   fi
   cd $d
}

# Update the pane name in TMUX to the SSH hostname
ssh()
{
   local ssh=$(which ssh)
   printf "\033]2;${@: -1}\033\\"
   $ssh "$@"
   printf "\033]2;$(hostname)\033\\"
}
