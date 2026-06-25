# the svn plugin has to be activated for this to work.
setopt PROMPT_SUBST

function get_k8s_env() {
  if [ -x "$(command -v kubectl 2>&1)" ]; then
    echo "k8s:(`kubectl config current-context | sed -n -e 's/.*\(paybase-\([a-z]*\)\).*/\1/p' | cut -d'-' -f2`) "
  fi
}

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
#PROMPT='%{$fg_bold[green]%}::%{$fg_bold[yellow]%} $(get_k8s_env)%{$fg_bold[yellow]%}%{$fg[cyan]%}[%~] %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)${ret_status}%{$fg_bold[green]%}%p%{$reset_color%}'
PROMPT='%{$fg_bold[green]%}:: [%m] %{$fg[cyan]%}[%~] %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}$(svn_prompt_info)${ret_status}%{$fg_bold[green]%}%p%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%} ✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}) "

ZSH_PROMPT_BASE_COLOR="%{$fg_bold[blue]%}"
ZSH_THEME_REPO_NAME_COLOR="%{$fg_bold[red]%}"

ZSH_THEME_SVN_PROMPT_PREFIX="svn:("
ZSH_THEME_SVN_PROMPT_SUFFIX=")"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg[red]%} ✘ %{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN=" "
