__set_current_git_branch() {
  __CURRENT_GIT_BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null)"
}

function __git_prompt_info() {
  if [ -n "$__CURRENT_GIT_BRANCH" ]; then
    printf "$1" "$__CURRENT_GIT_BRANCH"
  else
    printf "$2"
  fi
}
