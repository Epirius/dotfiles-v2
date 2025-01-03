
# Setting directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Downloading zinit if it's not there
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# sourcing zinit
source "${ZINIT_HOME}/zinit.zsh"

# starship prompt
eval "$(starship init zsh)"

# zsh plugins
zinit ice depth=1
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light agkozak/zsh-z
zinit light Aloxaf/fzf-tab

# snippets (oh my zsh)
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

# load completions
autoload -U compinit && compinit

zinit cdreplay -q

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa $realpath'

# fzf
eval "$(fzf --zsh)"

# history
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^H' backward-kill-word


if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias l="exa -la"
alias ls="exa"
alias find="fd"
alias vim="nvim"
alias ..="cd .."
alias reload="source ~/.zshrc"
alias c="clear"
alias yay="paru"
alias cg="cargo"
alias edit="lapce"
alias color="hyprpicker -a"
alias picker="hyprpicker -a"
alias image="feh"
alias "code ,"="code ."
