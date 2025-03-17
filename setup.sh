#!/usr/bin/env bash

set -euo pipefail
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

if [ "$(uname)" = "Darwin" ]; then
    echo -e "\e[32mStart setting up dotfiles on macOS.\e[0m"

    # Install Xcode Command Line Tools
    if ! xcode-select -p &>/dev/null; then
        echo -e "\e[33mInstalling Xcode Command Line Tools...\e[0m"
        xcode-select --install
        until xcode-select -p &>/dev/null; do
            sleep 5
        done
    fi

    # Install Homebrew
    if ! command -v brew &>/dev/null; then
        echo -e "\e[33mInstalling Homebrew...\e[0m"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        eval "$(/opt/homebrew/bin/brew shellenv)"  # Set up Homebrew for Apple Silicon
    fi

    # Run macOS setup script
    "$SCRIPT_DIR/setup/macOS/setup_darwin.sh" "$SCRIPT_DIR"

    echo -e "\e[32mFinish setting up dotfiles.\e[0m"
else
    echo -e "\e[31mSorry, this OS is not yet supported.\e[0m"
    exit 1
fi
