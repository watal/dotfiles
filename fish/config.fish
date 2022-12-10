source "$HOME/.config/fish/aliases.fish"
source "$HOME/.config/fish/anyenv.fish"

set -x theme_display_user yes
set -x LANG en_US
set -x LC_ALL en_US.UTF-8
set -x SHELL /usr/local/bin/fish

# tex
set -x PATH /Library/TeX/texbin $PATH

set -x PATH /usr/local/bin $PATH
set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/opt/curl/bin $PATH
set -x PATH /usr/local/opt/openssl/bin $PATH

set -x EDITOR vim $EDITOR

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
# set -g fish_color_valid_path --underline
set -g fish_color_history_current '89b8c2'
set -g fish_pager_color_completion 'c6c8d1'
set -g fish_pager_color_prefix 'c6c8d1' --bold
set -g fish_pager_color_description '9ac684'
set -g fish_pager_color_progress '9ac684' --bold

# golang
set -x GOPATH $HOME/src
set -x PATH $PATH $GOPATH/bin $PATH
set -x GOROOT /usr/local/Cellar/go/1.19.2/libexec

# if [ (echo $TMUX_PANE) != "" -a (echo $TMUX_PANE_AUTORUN) != "0" ]
#     ~/.tmux/plugins/tmux-logging/scripts/toggle_logging.sh; set -x TMUX_PANE_AUTORUN 0
# end

# Android SDK
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x PATH $ANDROID_HOME/tools $PATH
set -x PATH $ANDROID_HOME/platform-tools $PATH

set -x TMUX_TMPDIR /tmp

set -x PATH /Users/watal/development/flutter/bin $PATH
set -x PATH /Applications/Genymotion.app/Contents/MacOS/tools/ $PATH
set -x PATH /Users/watal/.cargo/bin $PATH
