# tmux
[ -z "$NOTMUX" ] && [ -z "$TMUX" ] && ! [ "$TERM_PROGRAM" = "vscode" ] && command -v tmux &> /dev/null && exec tmux && exit

# eval "$(zellij setup --generate-auto-start zsh)"
# eval "$(starship init zsh)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

bindkey -v
export KEYTIMEOUT=1

bindkey '^ ' autosuggest-accept # ctrl + enter to accept suggestion

# source antidote
source ~/.antidote/antidote.zsh
antidote load

alias ls='exa -F'
alias z='zellij'
alias q='qalc'
alias open='xdg-open'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias v=nvim
alias cal='cal -m'

setopt globdots # dot files in tab completion
setopt sharehistory

export EDITOR=nvim

# ctrl + arrow keys
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# flutter
export PATH="/opt/flutter/bin:$PATH"


# java
export JAVA_HOME='/usr/lib/jvm/java-17-openjdk'
#export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export PATH=$JAVA_HOME/bin:$PATH

# android stuff
export ANDROID_SDK_ROOT='/home/tomso/Android/Sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

export PATH="$PATH":"$HOME/.pub-cache/bin"

export CHROME_EXECUTABLE=/usr/bin/brave

#alias monitor='xrandr --output HDMI-0 --primary --mode 2560x1440 --pos 0x0 --rotate normal --output eDP-1-1 --mode 1920x1080 --pos 2560x360 --rotate normal --output DP-1-1 --off && xrandr --output HDMI-0 --mode 2560x1440 --rate 144'
alias monitor='xrandr --output eDP-1 --mode 1920x1080 --pos 2560x252 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-2 --off --output HDMI-2 --primary --mode 2560x1440 --pos 0x0 --rotate normal'
alias dmenu='rofi -dmenu -theme ~/.config/rofi/shutdown.rasi '
# alias weather='curl wttr.in/$1'

function weather { curl "wttr.in/$1" }


export UV_USE_IO_URING=0

clear
