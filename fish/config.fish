. ~/.config/fish/aliases.fish
. ~/.config/fish/anyenv.fish

#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

set -g theme_display_user yes
set -x LANG en_US
set theme_color_scheme zenburn

# tex
set -x PATH /Library/TeX/texbin $PATH

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/curl/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
