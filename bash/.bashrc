#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variables
export PATH="${HOME}/.local/bin:${HOME}/.local/bin/statusbar:${HOME}/go/bin:/sbin:${HOME}/.nimble/bin:${PATH}"
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

function mk_c() {
    PROJECTDIR="${PWD}/$1";
    MAKE_TEMPLATE_PATH="${HOME}/.dotfiles/misc/Makefile.mk"

    echo "[*] Creating project directory: ${PROJECTDIR}"
    mkdir -p "${PROJECTDIR}"

    echo "[*] Copying Makefile template to ${PROJECTDIR}"
    cp "$MAKE_TEMPLATE_PATH" "$PROJECTDIR/Makefile"

    echo "[*] Project directory created successfully"
    clang-format --dump-config -style Microsoft > "$PROJECTDIR/.clang-format"
    echo "[*] Clang-format config created successfully"
    echo "[*] Changing to project directory: ${PROJECTDIR}"
    cd "$PROJECTDIR" || exit
}

# Options
set -o vi

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
alias m_dup="xrandr --output HDMI-1 --mode 1920x1080 --same-as eDP-1"
alias m_ext="xrandr --output HDMI-1 --mode 1920x1080 --left-of eDP-1"
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

#. "$HOME/.cargo/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="/home/mowlandcodes/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export LINGO_20_HOME="/home/mowlandcodes/.cache/yay/lingo/src/usr/share/lingo"

export PATH="/home/mowlandcodes/.cache/yay/lingo/src/usr/share/lingo:$PATH"
