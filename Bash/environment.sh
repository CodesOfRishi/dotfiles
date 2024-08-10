# ┌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┐
# ╎ Environment variables ╎
# └╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌╌┘

# # User specific environment
# if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
#     PATH="$HOME/.local/bin:$HOME/bin:$PATH"
# fi
# export PATH

[[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]] || export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

[[ $(whereis -b nvim | awk '{print $2}') = *nvim ]] && export EDITOR="nvim"

# REF: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
export XDG_CONFIG_HOME="$HOME/.config" 
export XDG_DATA_HOME="$HOME/.local/share"

export GIT_CONFIG_GLOBAL="${XDG_CONFIG_HOME}/git/.gitconfig"
