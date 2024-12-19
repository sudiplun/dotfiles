# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=4000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt autocd # change directory just by typing its name

#zoxide
eval "$(zoxide init --cmd cd zsh)"
#ohmyposh
eval "$(oh-my-posh init zsh --config $HOME/dotfiles/ohmyposh/posh.toml)"

# autocompletion
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
else 
    echo "zsh-autosuggestions package not found"
fi
#with color

if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then 
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
fi
# end of completion

#aliases
if [ -e $HOME/.zsh_aliases ]; then
    source $HOME/.zsh_aliases
fi

export EDITOR="vim"

#deno
. "/home/lun/.deno/env"
