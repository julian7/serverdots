source ~/.shrc.d/git.sh

chpwd_functions=('__set_current_git_branch' ${chpwd_functions:#__set_current_git_branch})
preexec_functions=('__force_update_git_vars' ${precmd_functions:#__force_update_git_vars})
precmd_functions=('__update_git_vars' ${precmd_functions:#__update_git_vars})

function __force_update_git_vars() {
  case "$1" in
  *git*)
    # delay setting prompt until next precmd hook
    __update_git_vars=1
    ;;
  esac
}

function __update_git_vars() {
  if test -n "$__update_git_vars"; then
    __set_current_git_branch
    unset __update_git_vars
  fi
}

__update_git_vars=1
setopt prompt_subst
