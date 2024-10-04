# ╭─────────────────╮
# │ Tab Completions │
# ╰─────────────────╯

# To redraw line after fzf closes (printf '\e[5n') 
# This is useful when the terminal is altered by FZF, and the command line gets visually corrupted or misaligned
bind '"\e[0n": redraw-current-line' 2> /dev/null

# Tab comletion for $EDITOR
editor_completion() {
	local selected_result 
	if selected_result="$(compgen -f -- "${COMP_WORDS[COMP_CWORD]}" | command fzf \
		--prompt='❯ ' \
		--height=~100% \
		--tiebreak=begin,index \
		--select-1 \
		--exit-0 \
		--exact \
		--layout=reverse \
		--bind=tab:down,btab:up \
		--cycle)"; then
		COMPREPLY=( "${selected_result}" )
	fi
	printf '\e[5n'
}

# `v` is aliased to nvim
complete -F editor_completion "v"
