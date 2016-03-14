# vim:ft=zsh ts=2 sw=2 sts=2

# Variables
local cwd='${PWD/#$HOME/~}'

# Symbols
S_ARROW_D='\u25BC'
S_ARROW_U='\u25B2'
S_BRANCH='\ue0a0'
S_CIRCLE='\u25CF'
S_CROSS='\u2716 '
S_HISTORY='\u231B'
S_STAR='\u2731 '
S_TAG='\u2691'
S_TICK='\u2714'
S_RADIUS_B=$(echo "\u2514")
S_RADIUS_T=$(echo "\u250C")

# Colors and command prompts for root and regular user
if [[ $UID = 0 ]]; then
  _COMMAND_PROMPT="%{$fg_bold[red]%}#"
else
  _COMMAND_PROMPT="%{$fg_bold[green]%}$"
fi
_COMMAND_PROMPT="$_COMMAND_PROMPT%{$reset_color%} "

# History event number
_HISTORY="$(echo $S_HISTORY)%h"

# Partial prompts
PROMPT_PREFIX1="${S_BRANCH} "
PROMPT_PREFIX2="%{$fg[cyan]%}"
PROMPT_SUFFIX="%{$reset_color%}"
PROMPT_CLEAN=" %{$fg[green]%}${S_TICK}"
PROMPT_DIRTY=" %{$fg[red]%}${S_CROSS}"

# Git info
local git_info='$(git_prompt_info)'
local git_status='$(git_prompt_status)'
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[magenta]%}${S_ARROW_U}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%}${S_ARROW_D}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="${PROMPT_CLEAN}"
ZSH_THEME_GIT_PROMPT_DIRTY="${PROMPT_DIRTY}"
ZSH_THEME_GIT_PROMPT_PREFIX=" ${PROMPT_PREFIX1}${PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}O%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${PROMPT_SUFFIX}"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[yellow]%}O%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]%}*%{$reset_color%}"

# Prompt format: \n MACHINE: DIRECTORY BRANCH STATE \n USER $
PROMPT="
${S_RADIUS_T}%M: \
%{$fg_bold[blue]%}${cwd}%{$reset_color%} \
${git_info} \
${git_status}
${S_RADIUS_B}%n \
$_COMMAND_PROMPT"


# RPROMPT format: ExitCode HistoryEventNumber [TIME]
RPROMPT="%{$fg[yellow]%}%?%{$reset_color%} \
$_HISTORY \
[%*]"
