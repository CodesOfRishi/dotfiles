# git
if [[ $(whereis -b fzf | awk '{print $2}') = *fzf ]]; then
	gl() {
		git log --oneline --color=always | fzf --layout=reverse-list --preview="git show {1} --color=always" --ansi
	}
fi

# search & edit files
efile() {
	if [[ $( whereis -b bat | cut -d' ' -f2 ) ]]; then
		local filename="$( find -L . -type f -not -path './.git/*' | fzf --preview="bat --color=always {}" )"
	else
		local filename="$( find -L . -type f -not -path './.git/*' | fzf )"
	fi
	[[ ! -z "${filename}" ]] && "${EDITOR}" "${filename}"
}
