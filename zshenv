export HISTFILE=$HOME/.zshist
export HISTSIZE=1000
export SAVEHIST=2000
export WORDCHARS=${WORDCHARS/\//}
test -f $HOME/.zshenv.local && source $HOME/.zshenv.local
