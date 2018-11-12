#
# dznqbit .zshrc
#
# key bindings cheat sheet:
#
#   Alt-C: fzf cd into directory
#   Ctrl-F: fzf over files
#   Ctrl-R: fzf over history
#   Ctrl-T[tmux]: tmux pane manager
#

unsetopt correct_all

# History
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.zhistory
setopt inc_append_history


# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Use ripgrep as fulltext searcher
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# Rebind C-t to C-f
bindkey '^f' fzf-file-widget


# Autocomplete
autoload -U compinit promptinit
promptinit
compinit -i
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'


# Emacs movement bindings
bindkey -e                                             # Emacs bindings on console.
bindkey '^[^[[C' emacs-forward-word
bindkey '^[^[[D' emacs-backward-word
#bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
#bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word


# Colors
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi


# Prompt
setopt prompt_subst
git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "(${ref#refs/heads/})"
}
PROMPT='%D{%Y.%m.%d} %* %{$FG[110]%}%n@%m %{$FG[170]%}%~%{$FG[192]%}%{$reset_color%} $(git_prompt_info)%{$reset_color%} %{$FG[113]%}%# %{$reset_color%}'


# Source all files in ~/.zsh
for file in ~/.zsh/*.zsh; do
    source "$file"
done
