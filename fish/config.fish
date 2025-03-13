source "$HOME/.config/fish/aliases.fish"

# Android SDK
set -x ANDROID_HOME $HOME/Library/Android/sdk

set -x PATH \
    /usr/local/bin \
    /usr/local/sbin \
    /usr/local/opt/curl/bin \
    /usr/local/opt/openssl/bin \
    /Library/TeX/texbin \
    /Applications/Genymotion.app/Contents/MacOS/tools/ \
    /Users/watal/development/flutter/bin \
    /Users/watal/.cargo/bin \
    $ANDROID_HOME/tools $ANDROID_HOME/platform-tools \
    $HOME/.krew/bin \
    $PATH

set -x theme_display_user yes
set -x LANG en_US
set -x LC_ALL en_US.UTF-8
set -x SHELL /usr/local/bin/fish
set -x EDITOR vim

# Virtualenv
set -x WORKON_HOME $HOME/.virtualenvs
set -x VIRTUALENVWRAPPER_PYTHON /usr/local/bin/python3
set -x VIRTUALENVWRAPPER_VIRTUALENV /usr/local/bin/virtualenv

# Golang
set -x GOPATH $HOME/src
set -x GOROOT (realpath /usr/local/Cellar/go/*/libexec)
set -x PATH $GOPATH/bin $PATH

# tmux
set -x TMUX_TMPDIR /tmp
if test -n "$TMUX_PANE" -a "$TMUX_PANE_AUTORUN" != "0"
    ~/.tmux/plugins/tmux-logging/scripts/toggle_logging.sh
    set -x TMUX_PANE_AUTORUN 0
end

# kubernetes
set -gx KUBECONFIG "/Users/watal/ntnx"

# Custom color settings (iceberg)
set -g fish_color_normal 'c6c8d1'
set -g fish_color_command 'c6c8d1'
set -g fish_color_quote '89b8c2'
set -g fish_color_redirection '89b8c2'
set -g fish_color_end 'c6c8d1'
set -g fish_color_error 'e27878'
set -g fish_color_param '84a0c6'
set -g fish_color_comment '6b7089'
set -g fish_color_match 'ffffff' --background=3e445e
set -g fish_color_selection '89b8c2'
set -g fish_color_search_match '89b8c2'
set -g fish_color_operator '83a0c6'
set -g fish_color_escape '9ac684'
set -g fish_color_cwd '89b8c2'
set -g fish_color_autosuggestion '6b7089'
set -g fish_color_host 'c6c8d1'
set -g fish_color_user '89b8c2'
set -g fish_color_cansel '84a0c6'
set -g fish_color_history_current '89b8c2'
set -g fish_pager_color_completion 'c6c8d1'
set -g fish_pager_color_prefix 'c6c8d1' --bold
set -g fish_pager_color_description '9ac684'
set -g fish_pager_color_progress '9ac684' --bold
