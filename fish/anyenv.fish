# anyenv
source "/usr/local/Cellar/anyenv/1.1.5/libexec/../completions/anyenv.fish"
function anyenv
  set command $argv[1]
  set -e argv[1]

  command anyenv "$command" $argv
end

#nodevn
set -gx NODENV_ROOT "/Users/watal/.anyenv/envs/nodenv"
set -gx PATH $PATH "/Users/watal/.anyenv/envs/nodenv/bin"
set -gx PATH '/Users/watal/.anyenv/envs/nodenv/shims' $PATH
set -gx NODENV_SHELL fish
source '/Users/watal/.anyenv/envs/nodenv/libexec/../completions/nodenv.fish'
command nodenv rehash 2>/dev/null
function nodenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (nodenv "sh-$command" $argv|psub)
  case '*'
    command nodenv "$command" $argv
  end
end

# pyenv
set -gx PYENV_ROOT "/Users/watal/.anyenv/envs/pyenv"
set -gx PATH $PATH "/Users/watal/.anyenv/envs/pyenv/bin"
set -gx PATH '/Users/watal/.anyenv/envs/pyenv/shims' $PATH
set -gx PYENV_SHELL fish
source '/Users/watal/.anyenv/envs/pyenv/libexec/../completions/pyenv.fish'
command pyenv rehash 2>/dev/null
function pyenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (pyenv "sh-$command" $argv|psub)
  case '*'
    command pyenv "$command" $argv
  end
end

# rbenv
set -gx RBENV_ROOT "/Users/watal/.anyenv/envs/rbenv"
set -gx PATH $PATH "/Users/watal/.anyenv/envs/rbenv/bin"
set -gx PATH '/Users/watal/.anyenv/envs/rbenv/shims' $PATH
set -gx RBENV_SHELL fish
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    rbenv "sh-$command" $argv|source
  case '*'
    command rbenv "$command" $argv
  end
end

eval (nodenv init - | source)
