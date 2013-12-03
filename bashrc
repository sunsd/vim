
alias ...='. ~/.bashrc'
alias vi='vim'
#backup dir, used in ~/.vimrc
export BDIR=~/tmp/vim
alias ls='ls --color=auto -h'
alias l='ls -alFh'
alias xo='xdg-open'
alias si='sudo apt-get install'
alias dstat='dstat -cdlmnpsy'

#export M2_HOME=$HOME/apache-maven/apache-maven-3.1.0
#export M2=$M2_HOME/bin
#export MAVEN_OPTS="-Xms256m -Xmx512m"
#export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-i386/
#export PATH=$M2:$JAVA_HOME/bin:$HOME/bin:$PATH

export PATH=$HOME/local/bin:$PATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export MANPATH=$MANPATH:~/local/man
