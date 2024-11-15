#History
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
#zoxide
eval "$(zoxide init --cmd cd zsh)"
#ohmyposh
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/ohmyposh/posh.toml)"
# autocompletion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#A3B963"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
#with color
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
# end of completion
#aliases
source ~/.zsh_aliases
export EDITOR="vim"
#deno
. "/home/lun/.deno/env"
