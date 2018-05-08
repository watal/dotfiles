source "$HOME/.config/fish/aliases.fish"
source "$HOME/.config/fish/anyenv.fish"

#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

set theme_display_user yes
set LANG en_US

# tex
set PATH /Library/TeX/texbin $PATH

set PATH /usr/local/sbin $PATH
set PATH /usr/local/opt/curl/bin $PATH
set PATH /usr/local/opt/openssl/bin $PATH
