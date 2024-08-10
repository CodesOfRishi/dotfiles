# ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
# ╎ bash functions ╎
# └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘

gh() {
	[[ $( git rev-parse --is-inside-work-tree ) ]] || return
	git log --date=relative --format="%C(auto)%h%d %C(white)%s %C(cyan)%an %C(black)%C(bold)%cd%C(auto)" --graph --color=always | 
	fzf --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
		--header 'Press CTRL-S to toggle sort' \
		--preview='grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' | grep -o "[a-f0-9]\{7,\}"
		# --preview="git show {1} --color=always" | grep -o "[a-f0-9]\{7,\}"
}

# search & edit files
efile() {
	if [[ $( whereis -b bat | cut -d' ' -f2 ) ]]; then
		local filename="$( find -L . -type f -not -path './.git/*' | fzf --preview="bat --color=always {}" )"
	else
		local filename="$( find -L . -type f -not -path './.git/*' | fzf )"
	fi
	[[ ! -z "${filename}" ]] && "${EDITOR}" "${filename}"
}
