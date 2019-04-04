export PAGER=less
export LESS="-R -m"

test -f $HOME/.bash_profile.local && source $HOME/.bash_profile.local || true
test -f "$HOME/.bashrc && source $HOME/.bashrc || true
