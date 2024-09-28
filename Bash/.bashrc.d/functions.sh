# ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
# ╎ bash functions ╎
# └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘

gh() {
	[[ $( git rev-parse --is-inside-work-tree ) ]] || return
	git log --date=relative --format="%C(auto)%h%d %C(white)%s %C(cyan)%an %C(black)%C(bold)%cd%C(auto)" --graph --color=always | 
	fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
		--header 'Press CTRL-S to toggle sort' \
		--preview='grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | delta -n' \
		--bind 'enter:execute(grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | delta -n | less -R)'
		# --preview='grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' | grep -o "[a-f0-9]\{7,\}"
		# --preview="git show {1} --color=always" | grep -o "[a-f0-9]\{7,\}"
}

fl() {
	if [[ ! -f "${1}" ]]; then
		printf "Invalid file\n" >&2
		return 1
	fi

	if [[ -z "${2}" ]]; then
		local -a delimiter=( "" "" "󰇙" "󰴼" "󱋱" "󰇝" "" "󰿊" "󰤃" "" "" "󰕎" "" "󰜘" "󰕏" "󰘢" )
		local delim
		local all_delims_present=0
		for delim in "${delimiter[@]}"; do
			grep --silent -F "${delim}" "${1}" || break
			(( all_delims_present++ ))
		done

		[[ "${all_delims_present}" -eq "${#delimiter[@]}" ]] && {
			printf "The delimiters, %s are present in %s file. You will need to specifiy a delimiter manually as a second argument to the fl function.\n" "${delimiter[*]}" "${1}" >&2
			return 1
		}
		unset delimiter
		unset all_delims_present
	else
		local delim && delim="${2}"
	fi


	local line
	local line_no
	local colr_grey && colr_grey="\033[1;38;2;122;122;122m"
	local colr_green && colr_green='\033[1;38;2;170;255;0m'
	local colr_orange && colr_orange="\033[1;38;2;255;165;0m"
	local colr_rst && colr_rst='\e[0m'
	while read -r line; do
		line_no="${line%%:*}"
		line="${line#*:}"

		printf "${colr_orange}%s${colr_grey}${delim}${colr_green}%s${colr_grey}${delim}${colr_rst}%s\n" "${1}" "${line_no}" "${line}"
	done < <(grep -n -G '^.*$' "${1}") | fzf \
		--ansi \
		--scheme=history \
		--layout=reverse \
		--color "hl:-1:underline,hl+:-1:underline:reverse" \
		--delimiter="${delim}" \
		--nth=3 \
		--preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
		--preview="batcat --language=bash --color=always --highlight-line {2} {1}" \
		--bind 'enter:become(nvim -c {2} {1})'
}

commit_info() {
	CommitTypes() {
		local colr_orange && colr_orange="\033[1;38;2;255;165;0m"
		local colr_rst && colr_rst='\e[0m'
		printf "${colr_orange}feat${colr_rst}: A new feature\n"
		printf "${colr_orange}fix${colr_rst}: A bug fix\n"
		printf "${colr_orange}docs${colr_rst}: Documentation changes\n"
		printf "${colr_orange}style${colr_rst}: Code style (formatting) changes\n"
		printf "${colr_orange}refactor${colr_rst}: Code refactoring (no functionality changes)\n"
		printf "${colr_orange}perf${colr_rst}: Performance improvements\n"
		printf "${colr_orange}test${colr_rst}: Adding or updating tests\n"
		printf "${colr_orange}chore${colr_rst}: Non-code changes (like build tools, configs)\n"
		printf "${colr_orange}ci${colr_rst}: Continuous integration/deployment changes\n"
		printf "${colr_orange}build${colr_rst}: Changes affecting the build system or dependencies\n"
		printf "${colr_orange}revert${colr_rst}: Reverting a previous commit\n"
		printf "${colr_orange}BREAKING CHANGE${colr_rst}: A major change that breaks compatibility\n"
	}

	CommitTypes | fzf --ansi
}

# # search & edit files
# v() {
# 	if [[ -z "${*}" ]]; then 
# 		"${EDITOR}"
# 	else
# 		case "$1" in
# 			"-n"|"--new") "${EDITOR}" "${@:2}";;
# 			*) 
# 				if [[ $( whereis -b bat | cut -d' ' -f2 ) ]]; then
# 					local filename="$( find -L . -type f -not -path './.git/*' | fzf --prompt="nvim> " --exact --select-1 --exit-0 --exact --query="${*}" --preview="bat --color=always {}" )"
# 				else
# 					local filename="$( find -L . -type f -not -path './.git/*' | fzf --prompt="nvim> " --exact --select-1 --exit-0 --exact --query="${*}" --preview="cat {}" )"
# 				fi
#
# 				case "$?" in
# 					1) printf "No match!\n" 2>&1;;
# 					2) ;;
# 					130) ;;
# 					*)
# 						[[ ! -z "${filename}" ]] && "${EDITOR}" "${filename[@]}";;
# 				esac
# 				;;
# 		esac
# 	fi
# }
