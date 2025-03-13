# Path Settings

# Personal code path
export PATH=~/bin:$PATH

# MacPorts
if [ "$(uname)" == "Darwin" ]
then
   PATH=/opt/local/bin:/opt/local/sbin:/opt/local/libexec/docker/cli-plugins:$PATH:/opt/local/libexec/gnubin
   JAVA_HOME=$(/usr/libexec/java_home)
   MANPATH=/opt/local/share/man:$MANPATH
   # MacPorts conflicts with the system-installed iconv
   ICONV_INCLUDE_DIR="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/"
fi

# Rust
export PATH="$HOME/.cargo/bin:$PATH"
