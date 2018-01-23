. ~/.config/fish/aliases.fish
. ~/.config/fish/anyenv.fish

#peco
function fish_user_key_bindings
    bind \cr peco_select_history
end

set -g theme_display_user yes
set -x LANG en_US
set theme_color_scheme zenburn

set -U fish_user_paths "/usr/local/sbin"

# tex
set -x PATH /Library/TeX/texbin $PATH
