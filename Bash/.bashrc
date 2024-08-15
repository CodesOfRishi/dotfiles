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

#          ╭──────────────────────────────────────────────────────────╮
#          │                  RISHI'S CONFIGURATIONS                  │
#          ╰──────────────────────────────────────────────────────────╯

# start a Tmux session if not already running
# (keep this configuration as early as possible, e.g.- before aliases and custom functions)
if [[ $( command -v tmux &> /dev/null ) -eq 0 ]] && [[ $( tmux has-session ) -eq 0 ]] && [[ -n "${PS1}" ]] && [[ ! "${TERM}" =~ screen ]] && [[ ! "${TERM}" =~ (t|T)mux ]] && [[ -z "${TMUX}" ]]; then
	exec tmux new-session -s rishi-s1 -n 1stWin
fi

# source user specific configs files (from $HOME/.bashrc.d)
if [[ -d "$HOME/.bashrc.d" ]]; then
	for rc in $HOME/.bashrc.d/*; do
	[[ -f "$rc" ]] && [[ "$rc" =~ \.sh$ ]] && source "$rc" 
	done
fi
unset rc

# custom prompt
export PS1='\e[01;36m\A\e[0m \e[01;32m\u\e[0m \e[01;34m\w\e[0m \$ '

# FZF
eval "$(fzf --bash)" # Set up fzf key bindings and fuzzy completion

# testing navita tool
source "${HOME}/commandline-plugins/dev/navita/navita.sh"
[[ -d "${HOME}/dotfiles" ]] && alias dots="__navita__ ${HOME}/dotfiles"

