#!/bin/sh -

SCRIPT_DIR=$(cd $(dirname $0); pwd)

if [ `uname` == 'Darwin' ]; then
    echo $'\e[32mStart setting up dotfiles on macOS.\e[0m'
    $SCRIPT_DIR/setup/macOS/setup_darwin.sh $SCRIPT_DIR
    echo $'\e[32mFinish setting up dotfiles.\e[0m'
else
    echo $'\e[32mSorry, this OS is not yet supported.\e[0m'
fi
