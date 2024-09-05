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
elif [[ "$( tmux list-panes | wc -l )" -eq 1 ]]; then
	[[ "$( whereis -b fastfetch | cut -d ' ' -f2 )" =~ .*\/fastfetch$ ]] && fastfetch
fi

# source user specific configs files (from $HOME/.bashrc.d)
if [[ -d "$HOME/.bashrc.d" ]]; then
	for rc in $HOME/.bashrc.d/*; do
	[[ -f "$rc" ]] && [[ "$rc" =~ \.(sh|bash)$ ]] && source "$rc" 
	done
fi
unset rc

# FZF
[[ -f ~/.fzf.bash ]] && source ~/.fzf.bash

# testing navita tool
if [[ -f "${HOME}/commandline-plugins/dev/navita/navita.sh" ]]; then 
	source "${HOME}/commandline-plugins/dev/navita/navita.sh"
	[[ -d "${HOME}/dotfiles" ]] && alias dots="__navita__ ${HOME}/dotfiles"
fi

