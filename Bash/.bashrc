#    ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#    ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#    ██████╔╝███████║███████╗███████║██████╔╝██║     
#    ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
# ██╗██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ Rishi K.

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# RISHI'S CONFIGURATIONS

alias ll="ls -lshF --color=auto"
alias la="ls -lashF --color=auto"
alias lc="ls -lCF --color=auto"
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias less="less --use-color"
# alias v="nvim"

# EXPORT
[[ $(whereis -b nvim | awk '{print $2}') = *nvim ]] && export EDITOR="nvim"
# REF: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_DATA_HOME="$HOME/.local/share"
export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/.gitconfig"

# FZF
eval "$(fzf --bash)" # Set up fzf key bindings and fuzzy completion

# # A bash prompt that displays information about the current git repository.
# # REF: https://github.com/magicmonty/bash-git-prompt
# if [ -f "$HOME/commandline-plugins/bash-git-prompt/gitprompt.sh" ]; then
#     GIT_PROMPT_ONLY_IN_REPO=1
#     source "$HOME/commandline-plugins/bash-git-prompt/gitprompt.sh"
# fi

# testing navita tool
source "${HOME}/commandline-plugins/dev/navita/navita.sh"
alias cd="__navita__"

# git
if [[ $(whereis -b fzf | awk '{print $2}') = *fzf ]]; then
	gl() {
		git log --oneline --color=always | fzf --layout=reverse-list --preview="git show {1} --color=always" --ansi
	}
fi

# custom prompt
source ~/.config/bash/git-prompt.sh # git
export GIT_PS1_SHOWDIRTYSTATE=1
# PS1="\e[01;36m\A\e[0m \e[01;91m\u@\h\e[0m [\e[01;34m\w\e[0m]$ "
# export PS1='\e[01;36m\A\e[0m \e[01;32m\u@\h\e[0m [\e[01;34m\w\e[0m]\e[01;35m$(__git_ps1 " (%s)"\e[0m)\$ '
# export PS1='\e[01;36m\A\e[0m \e[01;32m\u@\h\e[0m [\e[01;34m\w\e[0m]$(__git_ps1 " (\e[01;33m%s\e[0m)")\$ '
export PS1='\e[01;36m\A\e[0m \e[01;32m\u@\h\e[0m \e[01;34m\w\e[0m $(__git_ps1 "(\e[01;33m%s\e[0m)")\$ '
