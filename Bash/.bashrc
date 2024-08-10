#    ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
#    ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
#    ██████╔╝███████║███████╗███████║██████╔╝██║     
#    ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
# ██╗██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═╝╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ Rishi K.

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

#          ╭──────────────────────────────────────────────────────────╮
#          │                  RISHI'S CONFIGURATIONS                  │
#          ╰──────────────────────────────────────────────────────────╯

[[ -f "$HOME/environment.sh" ]] && source "$HOME/environment.sh"
[[ -f "$HOME/aliases.sh" ]] && source "$HOME/aliases.sh"

# ── custom prompt ─────────────────────────────────────────────────────
source ~/.config/bash/git-prompt.sh # git
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\e[01;36m\A\e[0m \e[01;32m\u\e[0m \e[01;34m\w\e[0m $(__git_ps1 "(\e[01;33m%s\e[0m)")\$ '

# ── FZF ───────────────────────────────────────────────────────────────
eval "$(fzf --bash)" # Set up fzf key bindings and fuzzy completion

# # A bash prompt that displays information about the current git repository.
# # REF: https://github.com/magicmonty/bash-git-prompt
# if [ -f "$HOME/commandline-plugins/bash-git-prompt/gitprompt.sh" ]; then
#     GIT_PROMPT_ONLY_IN_REPO=1
#     source "$HOME/commandline-plugins/bash-git-prompt/gitprompt.sh"
# fi

# ── testing navita tool ───────────────────────────────────────────────
source "${HOME}/commandline-plugins/dev/navita/navita.sh"
[[ -d "${HOME}/dotfiles" ]] && alias dots="__navita__ ${HOME}/dotfiles"

# ── source functions ──────────────────────────────────────────────────
[[ -f "$HOME/functions.sh" ]] && source "$HOME/functions.sh"
