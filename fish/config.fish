source "$HOME/.config/fish/aliases.fish"
source "$HOME/.config/fish/anyenv.fish"

# peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

set -x theme_display_user yes
set -x LANG en_US
set -x LC_ALL en_US.UTF-8

# tex
set -x PATH /Library/TeX/texbin $PATH

set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/opt/curl/bin $PATH
set -x PATH /usr/local/opt/openssl/bin $PATH

# iterm
echo -ne "\033]6;1;bg;red;brightness;0\a\033]6;1;bg;green;brightness;0\a\033]6;1;bg;blue;brightness;0\a"
