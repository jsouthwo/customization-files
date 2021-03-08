 # ----------------------
 # Git Aliases
 # ----------------------
 alias g='git'

 if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
     . /etc/bash_completion
 fi


 function_exists() {
     declare -f -F $1 > /dev/null
     return $?
 }

for al in `git --list-cmds=alias`; do
    alias g$al="git $al"
    alias git$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done

cd C:/SKR/workspace/SKR_JASS_TEST/