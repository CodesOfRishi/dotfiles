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

# A bash prompt that displays information about the current git repository.
# REF: https://github.com/magicmonty/bash-git-prompt
if [ -f "$HOME/commandline-plugins/bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1

	# To list all themes{{{
	# git_prompt_list_themes | grep Ubuntu
	
	# GIT_PROMPT_THEME="BlackOrWhite"
	# GIT_PROMPT_THEME="Chmike"
	# GIT_PROMPT_THEME="Custom.bgptemplate"
	# GIT_PROMPT_THEME="Default"
	# GIT_PROMPT_THEME="Default_NoExitState"
	# GIT_PROMPT_THEME="Default_NoExitState_Ubuntu"
	# GIT_PROMPT_THEME="Default_Ubuntu"
	# GIT_PROMPT_THEME="Evermeet"
	# GIT_PROMPT_THEME="Evermeet_Lowres"
	# GIT_PROMPT_THEME="Evermeet_Ubuntu"
	GIT_PROMPT_THEME="Minimal_Chevron"
	# GIT_PROMPT_THEME="Minimal_UserHost"
	# GIT_PROMPT_THEME="Multi_line_NoExitState_Gentoo"
	# GIT_PROMPT_THEME="Plague_Doctor"
	# GIT_PROMPT_THEME="Single_line"
	# GIT_PROMPT_THEME="Single_line_Dark"
	# GIT_PROMPT_THEME="Single_line_Minimalist"
	# GIT_PROMPT_THEME="Single_line_Minimalist_robbyrussell"
	# GIT_PROMPT_THEME="Single_line_Minimalist_robbyrussell_kube-ps1"
	# GIT_PROMPT_THEME="Single_line_NoExitState"
	# GIT_PROMPT_THEME="Single_line_NoExitState_Gentoo"
	# GIT_PROMPT_THEME="Single_line_NoExitState_openSUSE"
	# GIT_PROMPT_THEME="Single_line_openSUSE"
	# GIT_PROMPT_THEME="Single_line_Solarized"
	# GIT_PROMPT_THEME="Single_line_Solarized_Lamda"
	# GIT_PROMPT_THEME="Single_line_Ubuntu"
	# GIT_PROMPT_THEME="Single_line_username_repo"
	# GIT_PROMPT_THEME="Solarized"
	# GIT_PROMPT_THEME="Solarized_NoExitState"
	# GIT_PROMPT_THEME="Solarized_NoExitState_Ubuntu"
	# GIT_PROMPT_THEME="Solarized_Ubuntu"
	# GIT_PROMPT_THEME="Solarized_UserHost"
	# GIT_PROMPT_THEME="TruncatedPwd_WindowTitle"
	# GIT_PROMPT_THEME="TruncatedPwd_WindowTitle_NoExitState"
	# GIT_PROMPT_THEME="TruncatedPwd_WindowTitle_NoExitState_Ubuntu"
	# GIT_PROMPT_THEME="TruncatedPwd_WindowTitle_Ubuntu"
	# GIT_PROMPT_THEME="Windows_UserHost"
	#}}}
	
    source "$HOME/commandline-plugins/bash-git-prompt/gitprompt.sh"
fi

# testing navita tool
source "${HOME}/commandline-plugins/dev/navita/navita.sh"
[[ -d "${HOME}/dotfiles" ]] && alias dots="__navita__ ${HOME}/dotfiles"

