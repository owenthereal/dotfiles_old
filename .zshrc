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
plugins=(git github golang osx brew gem lein mvim rake sublime bundler golang)

source $ZSH/oh-my-zsh.sh

export PS1="🚀  $PS1"

export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:$PATH

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

export EDITOR=vim

# Go Env
export GOPATH=$HOME/gocode
export PATH=$GOPATH/bin:$HOME/.cargo/bin:$HOME/.vim-go:$PATH

# Java Env
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JAVA_OPTS="-Xmx1024m"
export JRUBY_OPTS=--1.9
export SBT_OPTS="-XX:+CMSClassUnloadingEnabled"
export ANDROID_HOME=$(brew --prefix)/opt/android-sdk

# Ruby env
export RI="--format ansi --width 70"

# Other Env
export DART_FLAGS='--enable_type_checks --enable_asserts'
export PATH=$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:/usr/local/sbin:$PATH
export PATH=$HOME/.dotfiles/depot_tools:$PATH
export PATH=$HOME/bin:/Applications/dart/dart-sdk/bin:/Applications/dart/Chromium.app/Contents/MacOS:$PATH

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
alias eclipse='/Applications/eclipse/eclipse > /dev/null 2>&1 &'
alias cat=ccat
alias less='function __cless() { ccat --color=always $* | less }; __cless'

fpath=($(brew --prefix)/share/zsh-completions $fpath)

[ -f $HOME/.dotfiles/z/z.sh ] && . $HOME/.dotfiles/z/z.sh

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# custom
[ -f $HOME/.custom.sh ] && source $HOME/.custom.sh

# The next line updates PATH for the Google Cloud SDK.
[ -f $HOME/bin/google-cloud-sdk/path.zsh.inc ] && source $HOME/bin/google-cloud-sdk/path.zsh.inc

# The next line enables bash completion for gcloud.
[ -f $HOME/bin/google-cloud-sdk/completion.zsh.inc ] && source $HOME/bin/google-cloud-sdk/completion.zsh.inc

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
