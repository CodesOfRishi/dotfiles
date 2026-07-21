# ┌╌╌╌╌╌╌╌╌┐
# ╎ Prompt ╎
# └╌╌╌╌╌╌╌╌┘

# Git prompt
# Ref: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash
[[ -f "$HOME/apps/git-prompt.sh" ]] && source "$HOME/apps/git-prompt.sh" && export GIT_PS1_SHOWDIRTYSTATE=1

readonly __PS1_COLR_RST="\e[0m"
readonly __PS1_COLR_YELLOW="\e[01;33m"
readonly __PS1_COLR_GREY="\033[1;38;2;122;122;122m"
readonly __PS1_COLR_BLUE="\033[1;38;2;0;150;255m" 
readonly __PS1_COLR_RED="\033[1;38;2;255;0;0m"
readonly __PS1_COLR_GREEN="\e[1;32m"

__PS1_GENERATE_HORIZONTAL_LINE() {
	local -n ref_hr_line=$1
	printf -v ref_hr_line "%*s" "${2}" ""
	ref_hr_line=${ref_hr_line// /•}
}

SetPS1() {
	local __EXIT_CODE="$? "
	(( __EXIT_CODE <= 0 )) && __EXIT_CODE="" || __EXIT_CODE="✘ ${__EXIT_CODE}"

	local git_info=""
	if declare -F __git_ps1 >/dev/null; then
		git_info="$(__git_ps1 "%s")"
		[[ -n "${git_info}" ]] && git_info=" (${__PS1_COLR_YELLOW}${git_info}${__PS1_COLR_RST})"
	fi

	# virtual environment
	local venv_prompt_info=""
	if [[ -n "${VIRTUAL_ENV}" ]] && [[ $VIRTUAL_ENV =~ ^$VIRTUAL_ENV ]]; then 
		venv_prompt_info="(${__PS1_COLR_YELLOW}${VIRTUAL_ENV##*/}${__PS1_COLR_RST}) "
	elif [[ -n "${git_info}" ]]; then
		git_info="${git_info} "
	fi

	local _pwd="${PWD/#$HOME/\~}"
	
	# curr_width = size_of(exitcode + currenttime + pwd + spaces + date)
	local curr_width="$(( ${#__EXIT_CODE} + 5 + ${#_pwd} + 2 + 11 ))"
	(( curr_width = curr_width > COLUMNS ? COLUMNS : curr_width ))
	local hr_line=""
	__PS1_GENERATE_HORIZONTAL_LINE hr_line $(( COLUMNS - curr_width ))

	if [[ -n "${__EXIT_CODE}" ]]; then
		PS1="${__PS1_COLR_GREY}\A ${__PS1_COLR_BLUE}\w ${__PS1_COLR_GREY}${hr_line} ${__PS1_COLR_RED}${__EXIT_CODE}${__PS1_COLR_GREY}\d${__PS1_COLR_RST}"
		PS1="${PS1}\n${git_info}${venv_prompt_info}${__PS1_COLR_RED}󰁕${__PS1_COLR_RST} "
	else
		PS1="${__PS1_COLR_GREY}\A ${__PS1_COLR_BLUE}\w ${__PS1_COLR_GREY}${hr_line} \d${__PS1_COLR_RST}"
		PS1="${PS1}\n${git_info}${venv_prompt_info}${__PS1_COLR_GREEN}❱${__PS1_COLR_RST} "
	fi
}

export PROMPT_COMMAND="SetPS1"
