PROMPT='%{$fg[blue]%}%c/%{$reset_color%} $(git_prompt_info)%(!.#.$) '
RPROMPT='%{$fg[blue]%}[%{$fg[yellow]%}%*%{$fg[blue]%}]%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%})%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗"
