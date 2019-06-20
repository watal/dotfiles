#!/bin/sh -

# 第1引数がない場合は2階層上のファイルパスを取得
CWD=${1:-$(cd $(dirname $0)/../../; pwd)}


# pip3のパッケージ取得
# pipInstall() {
#     pip3 install -r $CWD/python3/
# }


# シンボリックリンク作成
symLinks() {
    # nvim
    echo 'Create symlinks for vim'
    ln -sf $CWD/nvim/init.vim ~/.vimrc

    # nvim
    echo 'Create symlinks for neovim'
    ln -sf $CWD/nvim/init.vim ~/.config/nvim/init.vim
    ln -sf $CWD/nvim/dein.toml ~/.config/dein/dein.toml
    ln -sf $CWD/nvim/dein_lazy.toml ~/.config/dein/dein_lazy.toml

    # fish
    echo 'Create symlinks for fish'
    ln -sf $CWD/fish/config.fish ~/.config/fish/config.fish
    ln -sf $CWD/fish/aliases.fish ~/.config/fish/aliases.fish
    ln -sf $CWD/fish/anyenv.fish ~/.config/fish/anyenv.fish
    find $CWD/fish/conf.d/* -type f -print  | awk -F"/" '{ print $NF }' | xargs -I{} ln -sf $CWD/fish/conf.d/{} ~/.config/fish/conf.d/{}
    find $CWD/fish/functions/* -type f -print  | awk -F"/" '{ print $NF }' | xargs -I{} ln -sf $CWD/fish/functions/{} ~/.config/fish/functions/{}

    # tmux
    echo 'Create symlinks for tmux'
    ln -sf $CWD/tmux/tmux.conf ~/.tmux.conf
    ln -sf $CWD/tmux/tmuxline.conf ~/.tmux/tmuxline.conf

    # peco
    echo 'Create symlinks for peco'
    ln -sf $CWD/peco/config.json ~/.config/peco/config.json

    # grc
    echo 'Create symlinks for grc'
    ln -sf $CWD/grc/conf.mtr ~/.grc/conf.mtr

    # latexmk
    echo 'Create symlinks for latexmk'
    ln -sf $CWD/latexmk/latexmkrc ~/.latexmkrc

    # karabiner
    echo 'Create symlinks for karabiner'
    ln -sf $CWD/karabiner/karabiner.json ~/.config/karabiner/karabiner.json
}


# 実行
# pipInstall
symLinks
