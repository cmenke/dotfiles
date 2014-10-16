# cmenke theme for oh-my-zsh

function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo "%m" #|| hostname
}

local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}git:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}*"

PROMPT="\
%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}$(box_name)\
:%{$fg_bold[blue]%}%2~ \
%{$fg_bold[green]%}❯%{$reset_color%} "

RPROMPT="${git_info}"
