# ┌╌╌╌╌╌╌╌╌┐
# ╎ Prompt ╎
# └╌╌╌╌╌╌╌╌┘

## create horizontal line
# declare ps1_ref_hr_line
# printf -v ps1_ref_hr_line "%*s" "${COLUMNS}" ""
# ps1_ref_hr_line=${ps1_ref_hr_line// /─}

## default color
# PS1='\n$(prmt --shell bash --code $? "{time:dim} {path:cyan:r}{git:purple:: :}{python:yellow:: 󰌠 v:}{rust:red::  v:}{node:green::  v:}{go:cyan:: 󰟓 v:} {ok:green:❱}{fail:red:❱} ")'

# catppuccin latte
# PS1="\033[1;38;2;122;122;122m${ps1_ref_hr_line}\e[0m"
PS1='\n$(prmt --shell bash --code $? "{time:dim} {path:#7287fd:r}{git:#8839ef:: :}{python:yellow:: 󰌠 v:}{rust:red::  v:}{node:green::  v:}{go:cyan:: 󰟓 v:} {ok:green:❱}{fail:red:❱} ")'

## catppuccin mocha
# PS1='\n$(prmt --shell bash --code $? "{time:dim} {path:#b4befe:r}{git:#cba6f7:: :}{python:yellow:: 󰌠 v:}{rust:red::  v:}{node:green::  v:}{go:cyan:: 󰟓 v:} {ok:green:❱}{fail:red:❱} ")'

## catppuccin frappe
# PS1='\n$(prmt --shell bash --code $? "{time:dim} {path:#babbf1:r}{git:#ca9ee6:: :}{python:yellow:: 󰌠 v:}{rust:red::  v:}{node:green::  v:}{go:cyan:: 󰟓 v:} {ok:green:❱}{fail:red:❱} ")'
