# ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
# ╎ Environment variables ╎
# └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘

if [[ -d "$HOME/.local/bin" ]] && [[ ! "$PATH" =~ $HOME/.local/bin(:|$) ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

if type -aP nvim &> /dev/null; then 
	export EDITOR="$(type -P nvim)"
fi

# REF: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
