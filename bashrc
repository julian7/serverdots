case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s checkwinsize

# Load configuration source files
for srcfile in $HOME/.shrc.d/*.sh $HOME/.shrc.d/*.bash; do
    source $srcfile
done

# Load local customizations
test -f $HOME/.bashrc.local && source $HOME/.bashrc.local
