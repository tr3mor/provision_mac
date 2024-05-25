### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

### OMZ plugins
zinit snippet OMZ::plugins/history/history.plugin.zsh
zinit snippet OMZ::plugins/kubectl/kubectl.plugin.zsh

### Plugins from homebrew
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### Completion
zinit light zsh-users/zsh-completions
zstyle ':completion:*:default' list-colors \
  "di=1;36" "ln=35" "so=32" "pi=33" "ex=31" "bd=34;46" "cd=34;43" \
  "su=30;41" "sg=30;46" "tw=30;42" "ow=30;43"
zstyle ':completion:*' menu select
autoload -U compinit && compinit

### History settings
setopt EXTENDED_HISTORY
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000
export HIST_STAMPS="%d.%m.%y %R"

### Wordchars
export WORDCHARS="_-"

### Starship
eval "$(starship init zsh)"

### Zoxide
eval "$(zoxide init zsh)"

### Aliases
alias ls="ls -G"
alias history="fc -l -E 1"
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
