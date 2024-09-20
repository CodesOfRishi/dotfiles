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

	grep -n -H -G '^.*$' "${1}" | \
		fzf \
			--color "hl:-1:underline,hl+:-1:underline:reverse" \
			--delimiter=":" \
			--preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
			--preview="batcat --language=bash --color=always --highlight-line {2} {1}" \
			--bind 'enter:become(nvim -c {2} {1})'
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
