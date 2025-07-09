# execute the hyprland with uwsm
if [[ -z $WAYLAND_DISPLAY ]] && [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]] && [[ -z $TMUX ]] && uwsm check may-start; then
    exec uwsm start hyprland.desktop
fi

# Customize the prompt with Git branch and status info
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

# Enable status checking
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '✔'
zstyle ':vcs_info:git:*' unstagedstr '✚'
zstyle ':vcs_info:git:*' untrackedstr '💥'

# Git prompt format
zstyle ':vcs_info:git:*' formats '(%b %u%c)'
# zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

# Show current directory and Git info
PROMPT='%~ ${vcs_info_msg_0_}> '

# Enable useful options
setopt autocd
bindkey -e

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=4000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
#setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt autocd # change directory just by typing its name

#zoxide
eval "$(zoxide init --cmd cd zsh)"

# autocompletion
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#999999"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
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
export PATH="$HOME/.local/bin:$PATH"
# yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
