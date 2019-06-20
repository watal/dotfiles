#!/bin/sh -

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ `uname` == 'Darwin' ]; then
    echo $'\e[32mStart setup of dotfiles on macOS\e[0m'
    $SCRIPT_DIR/setup/macOS/setup_darwin.sh $SCRIPT_DIR
fi
