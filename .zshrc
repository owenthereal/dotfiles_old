# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github osx brew gem mvim rake bundler golang z hub)

source $ZSH/oh-my-zsh.sh

#export PS1="🚀  $PS1"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

export SHELL=$(brew --prefix)/bin/zsh

export EDITOR=vim
export TERM=xterm-256color

# Go Env
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:$HOME/.cargo/bin:$PATH

# Java Env
export JAVA_HOME=$(/usr/libexec/java_home -v 9)
export JAVA_OPTS="-Xmx1024m"

# Ruby env
export RI="--format ansi --width 70"

# Other Env
export DART_FLAGS='--enable_type_checks --enable_asserts'
export PATH=$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH

# Customize to your needs...
unsetopt correct_all

# Enable color for ls
eval $(dircolors ~/.dir_colors)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# List direcory contents
export LS_OPTIONS='--color'
alias lsa='ls -lah $LS_OPTIONS'
alias l='ls -la $LS_OPTIONS'
alias ll='ls -l $LS_OPTIONS'
alias vi='vim'
alias svi='sudo vi'
alias eclipse='/Applications/eclipse/eclipse > /dev/null 2>&1 &'
alias cat='ccat'
alias c='clear'
alias h='history'
alias j='jobs -l'
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'
alias df='df -H'
alias du='du -ch'
alias k='kubectl'

man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# zsh

fpath=($(brew --prefix)/share/zsh-completions $fpath)
[ -f $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(rbenv init -)"
eval "$(nodenv init -)"

# Heroku

alias h="heroku"
alias hs="heroku sudo --reason reasons"
alias ic="ion-client"
alias debug="heroku_debug"

export ION_USER=owen.o

cloud() {
  eval "$(ion-client shell)"
  cloud "$@"
}

heroku_debug() {
  set -xg HEROKU_DEBUG 1
  set -xg HEROKU_DEBUG_HEADERS 1
  eval $argv
  set -e HEROKU_DEBUG
  set -e HEROKU_DEBUG_HEADERS
}

heroku_cloud_display() {
  if [[ ${HEROKU_CLOUD} != 'production' && ${HEROKU_CLOUD} != '' ]]; then
    echo "%{$fg[blue]%}[%{$fg[cyan]%}${HEROKU_CLOUD:u}%{$fg[blue]%}] "
  fi
}

# custom
[ -f $HOME/.custom.sh ] && source $HOME/.custom.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/bin/google-cloud-sdk/path.zsh.inc' ]; then source '$HOME/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/bin/google-cloud-sdk/completion.zsh.inc' ]; then source '$HOME/bin/google-cloud-sdk/completion.zsh.inc'; fi

if [ -f '$HOME/.cargo/env' ]; then source '$HOME/.cargo/env'; fi

export PATH=$HOME/bin/google-cloud-sdk/bin:$PATH
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH=$HOME/bin/flutter/bin:$PATH

export PATH="$(brew --prefix)/opt/qt/bin:$PATH"
export QT_HOMEBREW=true

ulimit -n 524288
ulimit -u 2048

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

export GO111MODULE=auto

export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"

# Wasmer
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"  # This loads wasmer

# Wasmtime
export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
