# ┌╌╌╌╌╌╌╌╌┐
# ╎ Prompt ╎
# └╌╌╌╌╌╌╌╌┘

# Git prompt
# Ref: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash
[[ -f "$HOME/commandline-plugins/git-prompt.sh" ]] && source "$HOME/commandline-plugins/git-prompt.sh" && export GIT_PS1_SHOWDIRTYSTATE=1

SetPS1() {
	local __EXIT_CODE="$? "
	(( __EXIT_CODE <= 0 )) && __EXIT_CODE=""

	local git_info="$(__git_ps1 "(\e[01;33m%s\e[0m)")"
	[[ -n "${git_info}" ]] && git_info=" ${git_info}"

	local colr_rst && colr_rst="\e[0m"
	local colr_grey && colr_grey="\033[1;38;2;122;122;122m"
	local colr_blue && colr_blue="\033[1;38;2;0;150;255m"
	local colr_cyan && colr_cyan="\033[1;38;2;0;170;170m"

	if [[ -n "${__EXIT_CODE}" ]]; then
		local colr_red && colr_red="\033[1;38;2;255;0;0m"
		PS1="${colr_red}${__EXIT_CODE}${colr_grey}\A ${colr_blue}\w${colr_rst}${git_info} ${colr_red}❱${colr_rst} "
	else
		PS1="${colr_grey}\A ${colr_blue}\w${colr_rst}${git_info} ${colr_cyan}❱${colr_rst} "
	fi
}

export PROMPT_COMMAND="SetPS1"
