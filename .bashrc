# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Large history
HISTSIZE=1000000

# if command -v lsd &> /dev/null
# then
#     # use the ls replacement "lsd"
#     alias ls='lsd'
#     alias ll='ls -laF'
# else 
#     alias ls='ls -F --color=auto'
#     alias ll='ls -la'
# fi

alias ls='ls -F --color=auto'
alias ll='ls -la'

# dotfile management - see https://news.ycombinator.com/item?id=11070797
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# use vim as a pager
[[ -f /usr/share/vim/vim82/macros/less.sh ]] && alias less='/usr/share/vim/vim82/macros/less.sh'
[[ -f /usr/local/share/vim/vim82/macros/less.sh ]] && alias less='/usr/local/share/vim/vim82/macros/less.sh'

# curl weather info
alias wttr='curl wttr.in'

# PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
# PS1="\n\[\e[32;1m\](\[\e[37;1m\]\u\[\e[32;1m\])-(\[\e[37;1m\]jobs:\j\[\e[32;1m\])-(\[\e[37;1m\]\w\[\e[32;1m\])\n(\[\[\e[37;1m\]! \!\[\e[32;1m\])-> \[\e[0m\]"

if [[ $COLORTERM = gnome-* && $TERM = xterm ]]  && infocmp gnome-256color >/dev/null 2>&1; then TERM=gnome-256color; fi
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
      BASE03=$(tput setaf 234)
      BASE02=$(tput setaf 235)
      BASE01=$(tput setaf 240)
      BASE00=$(tput setaf 241)
      BASE0=$(tput setaf 244)
      BASE1=$(tput setaf 245)
      BASE2=$(tput setaf 254)
      BASE3=$(tput setaf 230)
      YELLOW=$(tput setaf 136)
      ORANGE=$(tput setaf 166)
      RED=$(tput setaf 160)
      MAGENTA=$(tput setaf 125)
      VIOLET=$(tput setaf 61)
      BLUE=$(tput setaf 33)
      CYAN=$(tput setaf 37)
      GREEN=$(tput setaf 64)
    else
      BASE03=$(tput setaf 8)
      BASE02=$(tput setaf 0)
      BASE01=$(tput setaf 10)
      BASE00=$(tput setaf 11)
      BASE0=$(tput setaf 12)
      BASE1=$(tput setaf 14)
      BASE2=$(tput setaf 7)
      BASE3=$(tput setaf 15)
      YELLOW=$(tput setaf 3)
      ORANGE=$(tput setaf 9)
      RED=$(tput setaf 1)
      MAGENTA=$(tput setaf 5)
      VIOLET=$(tput setaf 13)
      BLUE=$(tput setaf 4)
      CYAN=$(tput setaf 6)
      GREEN=$(tput setaf 2)
    fi
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
else
    # Linux console colors. I don't have the energy
    # to figure out the Solarized values
    MAGENTA="\033[1;31m"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\033[1;37m"
    BOLD=""
    RESET="\033[m"
fi

parse_git_dirty () {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

PS1="\[${BOLD}${CYAN}\]\u \[$BASE0\]at \[$CYAN\]\h \[$BASE0\]in \[$BLUE\]\w\[$BASE0\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$YELLOW\]\$(parse_git_branch)\[$BASE0\]\n\$ \[$RESET\]"


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
    # GIT_PROMPT_FETCH_REMOTE_STATUS=0
    # To use upstream's default theme
    # GIT_PROMPT_THEME=Default
    # To use upstream's default theme, modified by arch maintainer
    # GIT_PROMPT_THEME=Default_Arch
    GIT_PROMPT_THEME=Solarized
    source /usr/lib/bash-git-prompt/gitprompt.sh
fi

[[ -f /etc/profile.d/bash_completion.sh ]] && source /etc/profile.d/bash_completion.sh 


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
