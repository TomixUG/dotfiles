# eval "$(zellij setup --generate-auto-start zsh)"
# eval "$(starship init zsh)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

bindkey '^ ' autosuggest-accept # ctrl + enter to accept suggestion

# source antidote
source '/usr/share/zsh-antidote/antidote.zsh'
antidote load

alias ls='exa -F'
alias z='zellij'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias v=nvim

setopt globdots # dot files in tab completion
setopt sharehistory

export EDITOR=nvim

# ctrl + arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
