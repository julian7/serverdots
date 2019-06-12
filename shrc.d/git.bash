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
    prompt_info=$(__git_prompt_info "$GITPROMPT_DETAILS")
    export PS1=$(printf "$GITPROMPT" "$prompt_info")
}
