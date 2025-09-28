# Source .bashrc if it's an interactive shell
if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
. "$HOME/.cargo/env"

export LINGO_20_HOME="/home/mowlandcodes/.cache/yay/lingo/src/usr/share/lingo"

export PATH="/home/mowlandcodes/.cache/yay/lingo/src/usr/share/lingo:$PATH"
