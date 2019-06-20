#!/bin/sh -

# 第1引数がない場合は2階層上のファイルパスを取得
CWD=${1:-$(cd $(dirname $0)/../../; pwd)}


# pip3のパッケージ取得
# pipInstall() {
#     pip3 install -r $CMD/python3/
# }


# シンボリックリンク作成
symLinks() {
    # nvim
    echo $'\e[32mCreate symlinks for neovim\e[0m'
    ln -sf $CWD/nvim/init.vim ~/.config/nvim/init.vim
    ln -sf $CWD/nvim/dein.toml ~/.config/dein/dein.toml
    ln -sf $CWD/nvim/dein_lazy.toml ~/.config/dein/dein_lazy.toml

    # tmux
    echo $'\e[32mCreate symlinks for tmux\e[0m'
    ln -sf $CWD/tmux/tmux.conf ~/.tmux.conf
    ln -sf $CWD/tmux/tmuxline.conf ~/.tmux/tmuxline.conf

    # peco
    echo $'\e[32mCreate symlinks for peco\e[0m'
    ln -sf $CMD/peco/config.json ~/.config/peco/config.json

    # grc
    echo $'\e[32mCreate symlinks for grc\e[0m'
    ln -sf $CMD/grc/conf.mtr ~/.grc/conf.mtr

    # latexmk
    echo $'\e[32mCreate symlinks for latexmk\e[0m'
    ln -sf $CMD/latexmk/latexmkrc ~/.latexmkrc

    # karabiner
    echo $'\e[32mCreate symlinks for karabiner\e[0m'
    ln -sf $CWD/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
}


# 実行
# pipInstall
symLinks
