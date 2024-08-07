# git
if [[ $(whereis -b fzf | awk '{print $2}') = *fzf ]]; then
	gl() {
		git log --oneline --color=always | fzf --layout=reverse-list --preview="git show {1} --color=always" --ansi
	}
fi

# search & edit files
efile() {
	local filename="$( find -L . -type f | fzf --preview="bat --color=always {}" )"
	[[ ! -z "${filename}" ]] && ${EDITOR} "${filename}"
}
