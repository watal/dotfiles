source "$HOME/.config/fish/aliases.fish"
source "$HOME/.config/fish/anyenv.fish"

#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

set -x theme_display_user yes
set -x LANG en_US

# tex
set -x PATH /Library/TeX/texbin $PATH

set -x PATH /usr/local/sbin $PATH
set -x PATH /usr/local/opt/curl/bin $PATH
set -x PATH /usr/local/opt/openssl/bin $PATH
