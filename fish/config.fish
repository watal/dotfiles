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

# bobthefish colorscheme
      #                 color
      #                 ------
      set -l red        e27828 a093c7
      set -l green      b4be82 99c684
      set -l yellow     e2a478
      set -l blue       84a0c6 89b8c2
      set -l grey       5a5f72
      set -l fg         161821 17171b 696d80
      set -l bg         818596 34394e
set -g theme_color_scheme user

set -g __color_initial_segment_exit  $blue[1] $fg[1]
set -g __color_initial_segment_su    $blue[1] $fg[1]
set -g __color_initial_segment_jobs  $blue[1] $fg[1]

set -g __color_path                  $grey[1] $fg[2]
set -g __color_path_basename         $grey[1] $fg[2]
set -g __color_path_nowrite          $green[1] $fg[1]
set -g __color_path_nowrite_basename $green[1] $fg[1]

set -g __color_repo                  $blue[1] $fg[1]
set -g __color_repo_work_tree        $blue[1] $fg[1]
set -g __color_repo_dirty            $red[1] $fg[1]
set -g __color_repo_staged           $green[1] $fg[1]

#------
set -g __color_vi_mode_default       $bg[1] $fg[2]
set -g __color_vi_mode_insert        $blue[1] $fg[1]
set -g __color_vi_mode_visual        $green[1] $fg[1]
#-----

set -g __color_vagrant               $blue[2] $fg[1]
set -g __color_username              $bg[1] $fg[1]
set -g __color_hostname              $bg[1] $fg[1]
set -g __color_rvm                   $yellow[1] $fg[1]
set -g __color_virtualfish           $blue[2] $fg[1]
set -g __color_virtualgo             $blue[2] $fg[1]
