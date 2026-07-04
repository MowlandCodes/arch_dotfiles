#
# ~/.bashrc
#

# Enable colored man pages
export MANPAGER="less -R --use-color -Dd+r -Du+b"
export MANROFFOPT="-c"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Environment Variables
export PATH="${HOME}/.local/bin:${HOME}/.local/bin/statusbar:${HOME}/go/bin:/sbin:${HOME}/.nimble/bin:${PATH}"
export RANGER_LOAD_DEFAULT_RC=FALSE
export QT_QPA_PLATFORMTHEME=qt5ct
export EDITOR="nvim"
export VISUAL="nvim"

function mk_c() {
    PROJECTDIR="${PWD}/$1";
    CMAKELIST_FILE="${HOME}/arch_dotfiles/misc/CMakeLists.txt"
    CLANG_FORMAT_FILE="${HOME}/arch_dotfiles/misc/.clang-format"

    echo "[*] Creating project directory: ${PROJECTDIR}"
    mkdir -p "${PROJECTDIR}"

    echo "[*] Copying CMakeLists template to ${PROJECTDIR}"
    cp "$CMAKELIST_FILE" "$PROJECTDIR/CMakeLists.txt"

    echo "[*] Project directory created successfully"

    cp "$CLANG_FORMAT_FILE" "$PROJECTDIR/.clang-format"
    echo "[*] Clang-format config created successfully"
    echo "[*] Changing to project directory: ${PROJECTDIR}"
    cd "$PROJECTDIR" || exit
    mkdir -p "${PROJECTDIR}/src" "${PROJECTDIR}/includes" "${PROJECTDIR}/build"
}

function to_webp(){
  if [[ -z "$1" ]]; then
    echo "Usage: to_webp <file>"
    return 1
  fi

  for file in "$@"; do
    filename="${file%.*}"

    if [[ -f "$file" ]]; then
      echo "Converting $file to webp..."
      ffmpeg -i "$file" -c:v libwebp -vf "scale=1920:-1" -quality 65 "${filename}.webp" -hide_banner -loglevel error
    else
      echo "$file is not a file"
    fi
  done
}

# Options
set -o vi

# Aliases
alias ls='eza --icons --group-directories-first'
alias ll='eza --icons --group-directories-first -lh -g --all'
alias lr='yazi'
alias grep='grep --color=auto'
alias conf_dwm='cd ${HOME}/suckless/dwm; nvim; make_dwm; cd -'
alias conf_dwmblocks='cd ${HOME}/suckless/dwmblocks; nvim; make_dwmblocks; reset_dwmblocks; cd -'
alias conf_autostart='nvim ${HOME}/.dwm/autostart.sh'
alias conf_sb_script='cd ~/.local/bin/statusbar; nvim; cd -'
alias make_dwm='cd ${HOME}/suckless/dwm; sudo cp config.def.h config.h; sudo cp patches.def.h patches.h; sudo make clean install; cd -'
alias make_st='cd ${HOME}/suckless/st; sudo cp config.def.h config.h; sudo make clean install; cd -'
alias make_dwmblocks='cd ${HOME}/suckless/dwmblocks; sudo make clean install; cd -'
alias reset_dwmblocks='reset_dwmblocks'
# alias cd="z"
alias lz="lazygit"
alias cat="bat --theme=OneHalfDark"
alias dev_esp=". $HOME/esp/esp-idf/export.sh"
alias venv="source .venv/bin/activate"

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

export PATH=/home/mowlandcodes/.cache/yay/lingo/src/usr/share/lingo:/home/mowlandcodes/.cargo/bin:$PATH:/opt/openresty/bin:/home/mowlandcodes/pear/bin

# PHPenv Initial
#eval "$(phpenv init -)"

###-begin-pm2-completion-###
### credits to npm for the completion file model
#
# Installation: pm2 completion >> ~/.bashrc  (or ~/.zshrc)
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _pm2_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           pm2 completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _pm2_completion pm2
elif type compctl &>/dev/null; then
  _pm2_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       pm2 completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _pm2_completion + -f + pm2
fi
###-end-pm2-completion-###

. "$HOME/.atuin/bin/env"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

complete -C /usr/bin/terraform terraform

[[ -s "/home/mowlandcodes/.gvm/scripts/gvm" ]] && source "/home/mowlandcodes/.gvm/scripts/gvm"

# using zoxide
unalias cd 2>/dev/null

alias cd="z"

# For Android Development
export ANDROID_HOME=/opt/android-sdk
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"

# opencode
export PATH=/home/mowlandcodes/.opencode/bin:$PATH

export PATH=$PATH:/home/mowlandcodes/.spicetify
