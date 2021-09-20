# drkat theme
# modified version of Sarah Port's theme below
# https://blog.carbonfive.com/writing-zsh-themes-a-quickref/

right_triangle() {
   echo $'\ue0b0'
}

prompt_indicator() {
   echo $'\u2728'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%B%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}%b"
}

ok_username() {
   ARROW_FG="016"
   ARROW_BG="015"
   NEXT_ARROW_BG="183"
   NEXT_ARROW_FG="015"
   echo "$(arrow_start) %n $(arrow_end)"
}

err_username() {
   ARROW_FG="016"
   ARROW_BG="160"
   NEXT_ARROW_BG="183"
   NEXT_ARROW_FG="160"
   echo "$(arrow_start) %n $(arrow_end)"
}

# return err_username if there are errors, ok_username otherwise
username() {
   echo "%(?.$(ok_username).$(err_username))"
}

directory() {
   ARROW_FG="016"
   ARROW_BG="183"
   NEXT_ARROW_BG="139"
   NEXT_ARROW_FG="183"
   echo "$(arrow_start) %2~ $(arrow_end)"
}

current_time() {
   echo "%B%F% {$FG[183]%} [ %D{%L:%M:%S} ]%f%b"
}

git_prompt() {
   ARROW_FG="016"
   ARROW_BG="139"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="096"
   echo "$(arrow_start) $(git_prompt_info) $(arrow_end)"
}

# returns 👾 if there are errors
return_status() {
   echo "%(?..👾)"
}

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[yellow]%}✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg_bold[green]%}✔"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✂%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ±%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%} ✱%{$reset_color%}"

PROMPT='$(username)$(directory)$(git_prompt)
$(prompt_indicator) '
RPROMPT='$(current_time)$(return_status)'