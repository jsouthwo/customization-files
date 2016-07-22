# /* vim: set filetype=sh : */ ~

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# OOI Specific {{{

    #export HTTP_PROXY=http://proxy.ext.ray.com:80
    #export HTTPS_PROXY=http://proxy.ext.ray.com:80
    #export NO_PROXY=localhost,127.0.0.0/8,149.145.152.224,.ray.com,ooicm
    export http_proxy=http://proxy.ext.ray.com:80
    export https_proxy=$http_proxy
    export no_proxy=localhost,127.0.0.0/8,149.145.152.224,.ray.com,ooicm
    #export no_proxy=localhost,127.0.0.0/8,149.145.152.224/22,.ray.com,ooicm
    # https://uframe-cm.ooi.rutgers.edu/projects/ooi/wiki/Proxy_Setup

    export UFRAME1_HOME=/home/${USER}/uframes/ooi
    export JAVA_HOME=${UFRAME1_HOME}/uframe-1.0/java
    export PATH=${JAVA_HOME}/bin:${PATH}

# }}}

# Generic bashrc {{{

    export SVN_EDITOR=/usr/bin/vim
    export EDITOR=/usr/bin/vim

    [ -f $HOME/.bash_aliases ] && . $HOME/.bash_aliases
    [ -f $HOME/.git-completion.bash ] && . ~/.git-completion.bash
    [ -f $HOME/.git-flow-completion.bash ] && . ~/.git-flow-completion.bash
    [ -f /etc/bash_completion ] && . /etc/bash_completion

    ###### HISTORY ######
    # Append to history
    shopt -s histappend
    # Force commands to one line
    shopt -s cmdhist
    HISTFILESIZE=1000000000
    HISTSIZE=1000000000
    HISTCONTROL=ignoredups:erasedups
    HISTIGNORE='bg:fg:history'
    HISTTIMEFORMAT='%F %T '

    # Some aliases
    alias ls='ls -GFh --color=auto --group-directories-first'
    alias l=ls
    alias la='ls -A'
    alias ll='ls -l'

    alias mgrep='grep -nrIT --color --exclude-dir=node_modules --exclude-dir=jquery-ui --exclude-dir=htmlcov'
    alias mygrep='grep -nrIT --color'

    alias vi=vim
    alias v=vim
    alias vless='vim -u /usr/share/vim/vim72/macros/less.vim'
    alias less='less -R'
    alias hist=history
    alias h=history

    alias c="cd"
    alias c..='cd ..'
    alias cd..='cd ..'
    alias ..='cd ..'
    alias .1='cd ..'
    alias ..1='cd ..'
    alias ...='cd ../..'
    alias .2='cd ../..'
    alias ..2='cd ../..'
    alias ....='cd ../../..'
    alias .3='cd ../../..'
    alias ..3='cd ../../..'
    alias .....='cd ../../../..'
    alias .4='cd ../../../..'
    alias ..4='cd ../../../..'

    alias g='git'
    alias gti='git'

    alias jobs='jobs -l'

    function lalala(){
        du -sh * .* | sort -rn | head -n 20
    }

    function lala(){
        du -ah . | sort -rn | head -n 20
    }

    alias path='echo $PATH | tr -s ":" "\n"'

    alias rm='rm -I'

    function cd(){
    ## Set 'cd' to automatically run 'ls'
        ARGUMENTS=$*
        if [ -z $ARGUMENTS ]; then
            builtin cd ~
            ls -GFh
            return
        else
            builtin cd "$*"
        fi
        RESULT=$?
        # Junky
        if [ $RESULT -eq 0 ]; then
            export PS1='\n\[$RESET$CYAN\][\d > \t] \[$RED$BOLD\][\w] \[$BOLD$GREEN\]$(git_prompt)\[$RESET$BLUE\]$(set_virtualenv)\[$RESET$MAGENTA\][command: \#] \[$YELLOW\][jobs: \j] \[$GREEN\][\u@\h]
    \[$RESET\]\[$GREEN\]\[$BLINK\]::: \[$RESET\]'
            ls -GFh
        else
            export PS1='\n\[$RESET$CYAN\][\d > \t] \[$RED$BOLD\][\w] \[$BOLD$GREEN\]$(git_prompt)\[$RESET$BLUE\]$(set_virtualenv)\[$RESET$MAGENTA\][command: \#] \[$YELLOW\][jobs: \j] \[$GREEN\][\u@\h]
    \[$RESET\]\[$RED\]\[$BLINK\]::: \[$RESET\]'
        fi
    }

    git_prompt () {
    ## Outputs git branch if in a repo
        if ! git rev-parse --git-dir > /dev/null 2>&1; then
            return 0
        fi

        git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

        echo "[$git_branch] "
    }

    set_virtualenv () {
    # Determine active Python virtualenv details.
        if [ -z "$VIRTUAL_ENV" ]; then
            return 0;
        fi
        #PYTHON_VIRTUALENV="[$BLUE][`basename \"$VIRTUAL_ENV\"`][$RESET] "
        virtualenv=$(basename "$VIRTUAL_ENV")
        echo "[$virtualenv] "
    }

    alias t='tinyhands'
    tinyhands()
    {
        if [ $# -eq 0 ]; then
            cd ~/Documents/472_cos/tinyhands/
        else
            cd ~/Documents/472_cos/tinyhands/*$1*
        fi
    }


    DEFAULT=$(tput setaf 9)
    BLACK=$(tput setaf 0)
    RED=$(tput setaf 1)
    GREEN=$(tput setaf 2)
    YELLOW=$(tput setaf 3)
    BLUE=$(tput setaf 4)
    MAGENTA=$(tput setaf 5)
    CYAN=$(tput setaf 6)
    WHITE=$(tput setaf 7)

    # DIM doesn't seem to work. Just reset.
    DIM=$(tput dim)
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
    START_UNDER=$(tput smul)
    END_UNDER=$(tput rmul)
    # reverses fg and bg
    REV=$(tput rev)
    BLINK=$(tput blink)

    # TODO: Fix the hackiness. Also, only make jobs show up if > 1?
    prompt='\n\[$RESET$CYAN\][\d > \t] \[$RED$BOLD\][\w] \[$BOLD$GREEN\]$(git_prompt)\[$RESET$BLUE\]$(set_virtualenv)\[$RESET$MAGENTA\][command: \#] \[$YELLOW\][jobs: \j] \[$GREEN\][\u@\h]
 \[$BOLD\]::: \[$RESET\]'
    export PS1=$prompt

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize

    # make less more friendly for non-text input files, see lesspipe(1)
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

    force_color_prompt=yes

    # Force 256 color terminal
    export TERM=xterm-256color

    # Find and xargs (to touch all files in the directories named javascript.
    # find . -type d -name javascript -print0 | xargs -0 -I{.} find {.} -exec touch {} \;

# }}}
