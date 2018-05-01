# anyenv
set -x PATH $usr/local/Cellar/anyenv/3cb8ad1/bin $PATH

# pyenv
set -x PYENV_ROOT "/usr/local/Cellar/anyenv/3cb8ad1/envs/pyenv"
set -x PATH $PATH "/usr/local/Cellar/anyenv/3cb8ad1/envs/pyenv/bin"
set -gx PATH '/usr/local/Cellar/anyenv/3cb8ad1/envs/pyenv/shims' $PATH
set -gx PYENV_SHELL fish
source '/usr/local/Cellar/anyenv/3cb8ad1/envs/pyenv/libexec/../completions/pyenv.fish'
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
set -x RBENV_ROOT "/usr/local/Cellar/anyenv/3cb8ad1/envs/rbenv"
set -x PATH $PATH "/usr/local/Cellar/anyenv/3cb8ad1/envs/rbenv/bin"
set -gx PATH '/usr/local/Cellar/anyenv/3cb8ad1/envs/rbenv/shims' $PATH
set -gx RBENV_SHELL fish
source '/usr/local/Cellar/anyenv/3cb8ad1/envs/rbenv/libexec/../completions/rbenv.fish'
command rbenv rehash 2>/dev/null
function rbenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (rbenv "sh-$command" $argv|psub)
  case '*'
    command rbenv "$command" $argv
  end
end
