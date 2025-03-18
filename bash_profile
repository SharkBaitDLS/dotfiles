# Path Settings

# Mac-specific configs
if [ "$(uname)" == "Darwin" ]
then
   # Ensure that even in nested shells/tmux sessions, we get a clean PATH and don't
   # allow path_helper's reordering.
   # See: https://superuser.com/questions/544989/does-tmux-sort-the-path-variable
   PATH=""
   source /etc/profile

   # MacPorts
   PATH="/opt/local/bin:/opt/local/sbin:/opt/local/libexec/docker/cli-plugins:$PATH:/opt/local/libexec/gnubin"
   JAVA_HOME=$(/usr/libexec/java_home)
   MANPATH=/opt/local/share/man:$MANPATH
   # MacPorts conflicts with the system-installed iconv
   ICONV_INCLUDE_DIR="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/"
fi

# Personal code path
export PATH="$HOME/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
