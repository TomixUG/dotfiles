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


# java
export JAVA_HOME='/usr/lib/jvm/java-20-openjdk'
export PATH=$JAVA_HOME/bin:$PATH

# android stuff
export ANDROID_SDK_ROOT='/opt/android-sdk'
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin/
export PATH=$PATH:$ANDROID_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/

export PATH="$PATH":"$HOME/.pub-cache/bin"

export CHROME_EXECUTABLE=/usr/bin/brave

alias monitor='xrandr --output HDMI-0 --mode 1280x1024 --pos 1920x0 --rotate normal --output eDP-1-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off'
alias extractFrame='/home/tomso/Coding/bash/bashscripts/extractFrame'


function android-demo-mode() {
  CMD=$1

  if [[ $CMD != "on" && $CMD != "off" ]]; then
    echo "Usage: $0 [on|off] [hhmm]" >&2
    return 1
  fi

  if [[ "$2" != "" ]]; then
    HHMM="$2"
  fi

  adb shell settings put global sysui_demo_allowed 1

  if [[ $CMD == "on" ]]; then
    adb shell am broadcast -a com.android.systemui.demo -e command enter
    if [[ "$HHMM" != "" ]]; then
      adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm ${HHMM}
    fi
    adb shell am broadcast -a com.android.systemui.demo -e command battery -e plugged false
    adb shell am broadcast -a com.android.systemui.demo -e command battery -e level 100
    adb shell am broadcast -a com.android.systemui.demo -e command network -e wifi show -e level 4
    adb shell am broadcast -a com.android.systemui.demo -e command network -e mobile show -e datatype none -e level 4
    adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false
  elif [[ $CMD == "off" ]]; then
    adb shell am broadcast -a com.android.systemui.demo -e command exit
  fi
}
