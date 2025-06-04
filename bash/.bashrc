#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variables
export PATH="${HOME}/.local/bin:${HOME}/.local/bin/statusbar:${HOME}/go/bin:${PATH}"
export RANGER_LOAD_DEFAULT_RC=FALSE
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR="nvim"
export VISUAL="nvim"

# Functions
function reset_dwmblocks(){
    pid_dwmblocks=$(pidof dwmblocks)

    if [[ "$pid_dwmblocks" != "" ]]; then
        echo "Resetting dwmblocks..."
        killall dwmblocks
        (dwmblocks &) 2>/dev/null
    else
        echo "dwmblocks is not running"
        echo "Starting dwmblocks..."
        (dwmblocks &) 2> /dev/null
        if [[ "$(pidof dwmblocks)" != "" ]]; then
            echo "[*] dwmblocks started successfully"
        fi
    fi
}

function toggle_picom() {
    if [[ -z "$(pidof picom)" ]]; then
        echo "[*] Enabling Picom..."
        (picom &)>/dev/null
        if [[ "$(pidof picom)" != "" ]]; then 
            echo "[*] Picom started successfully"
        else
            echo "[!] Picom failed to start"
        fi
    else
        echo "[*] Disabling Picom..."
        killall picom
        echo "[*] Picom stopped successfully"
    fi
}

# Aliases
alias ls='eza --icons --group-directories-first'
alias ll='eza --icons --group-directories-first -lh --all'
alias lr='ranger'
alias grep='grep --color=auto'
alias conf_st='cd ${HOME}/suckless/st; nvim; make_st; cd -'
alias conf_dwm='cd ${HOME}/suckless/dwm; nvim; make_dwm; cd -'
alias conf_dwmblocks='cd ${HOME}/suckless/dwmblocks; nvim; make_dwmblocks; reset_dwmblocks; cd -'
alias conf_autostart='nvim ${HOME}/.dwm/autostart.sh'
alias conf_sb_script='cd ~/.local/bin/statusbar; nvim; cd -'
alias make_dwm='cd ${HOME}/suckless/dwm; sudo cp config.def.h config.h; sudo cp patches.def.h patches.h; sudo make clean install; cd -'
alias make_st='cd ${HOME}/suckless/st; sudo cp config.def.h config.h; sudo make clean install; cd -'
alias make_dwmblocks='cd ${HOME}/suckless/dwmblocks; sudo make clean install; cd -'
alias reset_dwmblocks='reset_dwmblocks'
alias cd="z"
alias lz="lazygit"
alias dev_esp=". $HOME/Documents/@PRIVACY/@MY_CODE/IoT/esp-idf/export.sh"

# Terminal Prompt
PS1='[\u@\h \W]\$ '

# Initial Command
source $HOME/ble.sh/out/ble.sh
eval "$(starship init bash)"
eval "$(zoxide init bash)"
clear
fastfetch


# Generated for pdtm. Do not edit.
export PATH=$PATH:/home/mowlandcodes/.pdtm/go/bin

