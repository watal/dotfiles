# anyenv
source '/usr/local/Cellar/anyenv/1.1.1/libexec/../completions/anyenv.fish'
function anyenv
  set command $argv[1]
  set -e argv[1]

  command anyenv "$command" $argv
end

# pyenv
set -x PYENV_ROOT '/Users/watal/.anyenv/envs/pyenv'
set -x PATH '/Users/watal/.anyenv/envs/pyenv/bin' $PATH
set -gx PATH '/Users/watal/.anyenv/envs/pyenv/shims' $PATH
set -gx PYENV_SHELL fish
source '/Users/watal/.anyenv/envs/pyenv/libexec/../completions/pyenv.fish'
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
set -x RBENV_ROOT '/Users/watal/.anyenv/envs/rbenv'
set -x PATH '/Users/watal/.anyenv/envs/rbenv/bin' $PATH
set -gx PATH '/Users/watal/.anyenv/envs/rbenv/shims' $PATH
set -gx RBENV_SHELL fish
source '/Users/watal/.anyenv/envs/rbenv/libexec/../completions/rbenv.fish'
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
