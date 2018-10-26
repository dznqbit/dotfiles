unsetopt correct_all

# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# location of history
export HISTFILE=~/.zhistory
# append command to history file once executed
setopt inc_append_history

# FZF
# https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
# Needed to play nice with Vim
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

autoload -U compinit
compinit -i

autoload -U promptinit
promptinit


bindkey -e                                            # Emacs bindings on console.
bindkey '^[^[[C' emacs-forward-word
bindkey '^[^[[D' emacs-backward-word
#bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
#bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word


zstyle ':completion::complete:*' use-cache 1

autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
setopt prompt_subst

git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})"
}

PROMPT='%D{%Y.%m.%d} %* %{$FG[110]%}%n@%m %{$FG[170]%}%~%{$FG[192]%}%{$reset_color%} $(git_prompt_info)%{$reset_color%} %{$FG[113]%}%# %{$reset_color%}'

# Add fuzzyfinder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Source all files in ~/.zsh
for file in ~/.zsh/*.zsh; do
    source "$file"
done
