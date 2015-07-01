# cmenke theme for oh-my-zsh

cmnk_git_arrows() {
  # check if there is an upstream configured for this branch
  command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

  local arrows=""
  (( $(command git rev-list --right-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows='⇣'
  (( $(command git rev-list --left-only --count HEAD...@'{u}' 2>/dev/null) > 0 )) && arrows+='⇡'
  # output the arrows
  [[ "$arrows" != "" ]] && echo "${arrows}"
}


cmnk_get_username() {
  local prompt_pure_username='%F{green}%n%f'

  # show username@host if logged in through SSH
  [[ "$SSH_CONNECTION" != '' ]] && prompt_pure_username='%F{green}%n%f%F{cyan}@%f%F{green}$(box_name)%f'

  # show username@host if root, with username in white
  [[ $UID -eq 0 ]] && prompt_pure_username='%F{white}%n%f%F{red}@%f%F{green}$(box_name)%f'

  echo "${prompt_pure_username}"
}


function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo "%m" #|| hostname
}

# prevent percentage showing up
# if output doesn't end with a newline
export PROMPT_EOL_MARK=''
prompt_opts=(cr subst percent)

PROMPT="$(cmnk_get_username):%F{blue}%2~%f \
%(?.%F{green}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f "

local git_info='$(git_prompt_info) %F{cyan}$(cmnk_git_arrows)%f'
ZSH_THEME_GIT_PROMPT_PREFIX="git:%F{cyan}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$f"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}*%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{green}*%f"

RPROMPT="${git_info}"
