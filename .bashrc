# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Large history
HISTSIZE=1000000

if command -v lsd &> /dev/null
then
    # use the ls replacement "lsd"
    alias ls='lsd'
    alias ll='ls -laF'
else 
    alias ls='ls -F --color=auto'
    alias ll='ls -la'
fi

# dotfile management - see https://news.ycombinator.com/item?id=11070797
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# use vim as a pager
alias less='/usr/share/vim/vim82/macros/less.sh'

# curl weather info
alias wttr='curl wttr.in'

PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"


# source local .bashrc for custom settings
[[ -f .bashrc.local ]] && source .bashrc.local

# source fzf config
[[ -f /usr/share/fzf/key-bindings.bash ]] && source /usr/share/fzf/key-bindings.bash
[[ -f /usr/share/fzf/shell/key-bindings.bash ]] && source /usr/share/fzf/shell/key-bindings.bash
[[ -f /usr/share/fzf/completion.bash ]] && source /usr/share/fzf/completion.bash

currentDir=$(pwd)
if [ -f /usr/lib/bash-git-prompt/gitprompt.sh ] && [ ! $currentDir == /run* ];
then
    # To only show the git prompt in or under a repository directory
    GIT_PROMPT_ONLY_IN_REPO=1
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    # To use upstream's default theme
    GIT_PROMPT_THEME=Default
    # To use upstream's default theme, modified by arch maintainer
    #GIT_PROMPT_THEME=Default_Arch
    #GIT_PROMPT_THEME=Solarized
    source /usr/lib/bash-git-prompt/gitprompt.sh
fi

[[ -f /etc/profile.d/bash_completion.sh ]] && source /etc/profile.d/bash_completion.sh 

