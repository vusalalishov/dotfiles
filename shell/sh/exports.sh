bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export CFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export LIBRARY_PATH="/usr/local/Cellar/openssl@1.1/lib"
export JAVA_HOME=`asdf which java | sed 's=/bin/java==g'`

eval $(thefuck --alias)

export LDFLAGS="-L/usr/local/opt/avr-gcc@8/lib"
export GPG_TTY=$(tty)

export PATH="/usr/local/go/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH=$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH
export PATH="$PATH:$HOME/tools/protoc/bin:$HOME/go-bin"
export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
export PATH="$PATH:$HOME/tools/"
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="/usr/local/Cellar/cmake/3.24.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export PATH="/usr/local/Cellar/vim/9.0.0350_1/bin:$PATH"
export VIMRUNTIME="/usr/local/Cellar/vim/9.0.0350_1/share/vim/vim90"