# Path Settings

   # MacPorts path variables
   export PATH=/opt/local/libexec/gnubin:/opt/local/bin:/opt/local/sbin:$PATH

   # Java
   export PATH=$PATH:/Library/Java/JavaVirtualMachines/jdk1.7.0_21.jdk/Contents/Home/bin/
   export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
   # MySQL path
   export PATH=/opt/local/lib/mysql56/bin:$PATH

   # Personal code path
   export PATH=~/bin:$PATH

# Aliases

   alias reload='source ~/.profile'
   alias bye='logout'
   alias logotu='logout'
   alias ls='ls --color=auto'
   alias java6='/usr/libexec/java_home -v "1.6.*"'
   alias clean='make clean'

# Other Settings

   HISTCONTROL=ignoredups
   EDITOR=vim
   PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \$ '
   eval `dircolors ./dir_colors`

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
