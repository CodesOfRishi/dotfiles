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
	[[ -n "${git_info}" ]] && git_info=" ${git_info} "

	local colr_rst && colr_rst="\e[0m"
	local colr_grey && colr_grey="\033[1;38;2;122;122;122m"
	local colr_blue && colr_blue="\033[1;38;2;0;150;255m"

	generate-horizontal-line() {
		local hr_line
		printf -v hr_line "%*s\n" "${1:-${COLUMNS}}" ""
		printf "%s\n" "${hr_line// /•}"
	}

	local _pwd="${PWD/#$HOME/\~}"
	# curr_width = size_of(exitcode + currenttime + pwd + spaces)
	local curr_width="$(( ${#__EXIT_CODE} + 5 + ${#_pwd} + 2 ))"

	if [[ -n "${__EXIT_CODE}" ]]; then
		local colr_red && colr_red="\033[1;38;2;255;0;0m"
		PS1="${colr_red}${__EXIT_CODE}${colr_grey}\A ${colr_blue}\w${colr_rst}${colr_grey} $(generate-horizontal-line $(( $COLUMNS - $curr_width )))${colr_rst}"
		PS1="${PS1}\n${git_info}${colr_red}󰁕${colr_rst} "
	else
		local colr_cyan && colr_cyan="\033[1;38;2;0;170;170m"
		PS1="${colr_grey}\A ${colr_blue}\w${colr_rst}${colr_grey} $(generate-horizontal-line $(( $COLUMNS - $curr_width )))${colr_rst}"
		PS1="${PS1}\n${git_info}${colr_cyan}❱${colr_rst} "
	fi
}

export PROMPT_COMMAND="SetPS1"
