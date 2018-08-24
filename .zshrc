#
# .zshrc
# Executes commands at the start of an interactive session.
#
# Other files to check:
#   ~/.zpreztorc 
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# disable autocorrect
unsetopt CORRECT

source ~/.zsh/aliases.zsh

# Add FZF - fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
