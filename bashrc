# Path Settings

   # Personal code path
   export PATH=~/bin:$PATH

# Aliases

   alias reload='source ~/.bashrc'
   alias bye='logout'
   alias logotu='logout'
   alias ls='ls --color=auto'
   alias clean='make clean'

# Other Settings

   HISTCONTROL=ignoredups
   EDITOR=vim
   PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
   eval `dircolors $( dirname ${BASH_SOURCE[0]})/dir_colors`

   # extended patterns! Look at all the regular expressions we can use!
   shopt -s extglob

# Functions

   # who needs cd ../../ ?
   up()
   {
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
