source ~/.shrc.d/git.sh

__git_install_prompt() {
    GITPROMPT="$1"
    GITPROMPT_DETAILS="$2"
    PROMPT_COMMAND='__git_set_prompt'
}

__git_set_prompt() {
    if [[ "$PWD" != "$oldpwd" ]]; then
        oldpwd="$PWD"
        __set_current_git_branch
    fi
    export PS1=$(printf "$GITPROMPT" __git_prompt_info($GITPROMPT_DETAILS))
}
