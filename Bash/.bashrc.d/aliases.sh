# ┌╌╌╌╌╌╌╌╌╌┐
# ╎ Aliases ╎
# └╌╌╌╌╌╌╌╌╌┘

# alias ll="ls -lhF --color=auto"
# alias la="ls -lahF --color=auto"
# alias lc="ls -lCF --color=auto"
alias ll="eza -laF --smart-group"
alias lt="eza -lahF --tree --smart-group -I '.git'"
alias la="eza -aF --oneline --icons=auto"
alias l="eza -aF --oneline --icons=auto -G"
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias mv="mv -i"
alias cp="cp -i"
alias rm="rm -i"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
# alias bat="batcat"
alias v="nvim-linux-x86_64.appimage"
alias nvim="nvim-linux-x86_64.appimage"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

# # Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
