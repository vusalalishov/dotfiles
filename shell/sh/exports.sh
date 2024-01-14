export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GPG_TTY=$(tty)
export PATH="$PATH:/opt/homebrew/bin"

export PATH="$PATH:$HOME/tools/"
export PATH="$HOME/.asdf/shims:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH=$(brew --prefix)/opt/findutils/libexec/gnubin:$PATH
export PATH="$HOME/tools/protoc/bin:$HOME/go-bin:$PATH"
export PATH="/usr/local/opt/avr-gcc@8/bin:$PATH"
export PATH="/usr/local/Cellar/cmake/3.24.1/bin:$PATH"
export PATH="/usr/local/opt/gnu-time/libexec/gnubin:$PATH"
export PATH="/Users/vusal.alishov/projects/go/k9s/execs:$PATH"
export PATH="/Users/vusal.alishov/projects/go/helm/bin:$PATH"
export PATH="/Users/vusal.alishov/projects/go/stern/dist:$PATH"
export PATH="/Users/vusal.alishov/projects/go/trdsql:$PATH"
export PATH="$(asdf where rust)/bin:$PATH"

export GOBIN="/usr/local/bin"

export LDFLAGS="-L/usr/local/opt/openssl@3/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@3/include"
export PATH="/usr/local/Cellar/vim/9.0.0350_1/bin:$PATH"
export GLFW_IM_MODULE="none"

export JAVA_HOME=`asdf which java | sed 's=/bin/java==g'`

export CFLAGS="-I$(brew --prefix openssl)/include $CFLAGS"
export LDFLAGS="-L$(brew --prefix openssl)/lib $LDFLAGS"

export LDFLAGS="-L/opt/homebrew/opt/openssl@3/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl@3/include"
export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL=1
export GRPC_PYTHON_BUILD_SYSTEM_ZLIB=1
export PATH="$HOME/.local/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@3/lib/pkgconfig"
export LIBRARY_PATH="/opt/homebrew/opt/openssl@3/lib"

export LDFLAGS="-L/usr/local/opt/avr-gcc@8/lib"
export PATH="/opt/homebrew/Cellar/jq/1.6/bin:$PATH"
export PATH="/opt/homebrew/Cellar/bash/5.2.15/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
