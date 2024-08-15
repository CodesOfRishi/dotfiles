# ┌╌╌╌╌╌╌╌╌┐
# ╎ Prompt ╎
# └╌╌╌╌╌╌╌╌┘

# Git prompt
# Ref: https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash
[[ -f "$HOME/.config/bash/git-prompt.sh" ]] && source "$HOME/.config/bash/git-prompt.sh" && export GIT_PS1_SHOWDIRTYSTATE=1

SetPS1() {
	local git_root_dir
	git_root_dir="$( git rev-parse --show-toplevel 2> /dev/null )"
	git_root_dir="${git_root_dir##\/*\/}"

	local git_curr_dir 
	git_curr_dir="${git_root_dir}/$( git rev-parse --show-prefix 2> /dev/null )"
	git_curr_dir="${git_curr_dir%\/}"

	unset git_root_dir

	local non_git_parent_path && non_git_parent_path="${PWD%%${git_curr_dir}}"
	non_git_parent_path=${non_git_parent_path/#${HOME}/\~}

	local cyan_bold && cyan_bold="\033[1;38;2;0;170;170m "
	local green_bold && green_bold="\033[1;38;2;0;170;0m"
	local blue_bold && blue_bold="\033[1;38;2;100;120;255m"
	local grey_bold && grey_bold="\033[1;38;2;127;127;127m"
	local col_rst && col_rst="\e[0m"

	PS1="${cyan_bold}\A${col_rst} ${green_bold}\u${col_rst} ${grey_bold}${non_git_parent_path}${col_rst}${blue_bold}${git_curr_dir}${col_rst} $(__git_ps1 "(\e[01;33m%s\e[0m)")\$ "
}

export PROMPT_COMMAND="SetPS1"
