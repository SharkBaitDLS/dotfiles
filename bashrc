# Path Settings

   # Personal code path
   export PATH=~/bin:$PATH

   # MacPorts
   if [ "$(uname)" == "Darwin" ]
   then
      PATH=/opt/local/bin:/opt/local/sbin:/opt/local/libexec/gnubin:$PATH
      MANPATH=/opt/local/share/man:$MANPATH
   fi

# Aliases

   alias reload='source ~/.bashrc'
   alias bye='logout'
   alias logotu='logout'
   alias ls='ls --color=auto'
   alias clean='make clean'

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

# Functions

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

   # makes a directory then moves into it
   mkcdr()
   {
      mkdir $1
      cd $1
   }

   ssh()
   {
      ssh=$(which ssh)
      printf "\033]2;$1\033\\"
      $ssh "$@"
      printf "\033]2;$(hostname)\033\\"
   }
