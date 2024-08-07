# git
if [[ $(whereis -b fzf | awk '{print $2}') = *fzf ]]; then
	gl() {
		git log --oneline --color=always | fzf --layout=reverse-list --preview="git show {1} --color=always" --ansi
	}
fi
