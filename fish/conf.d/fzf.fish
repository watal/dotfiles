set -x FZF_TMUX_HEIGHT "40%"
set -x FZF_DEFAULT_OPTS "--height $FZF_TMUX_HEIGHT"
set -x FZF_LEGACY_KEYBINDINGS 1
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
