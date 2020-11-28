# set editor and pager
export EDITOR='vim'
export PAGER='less'

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# export path of esp8266 rtos sdk
export IDF_PATH="/home/luca/esp/ESP8266_RTOS_SDK"

# we don't want to send telemetry to MS when working with .net Core
export DOTNET_CLI_TELEMETRY_OPTOUT=1

[[ -f ~/.bash_profile.local ]] && . ~/.bash_profile.local
[[ -f ~/.bashrc ]] && . ~/.bashrc

