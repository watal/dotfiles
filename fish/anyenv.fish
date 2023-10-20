# anyenv
function anyenv
  set command $argv[1]
  set -e argv[1]

  command anyenv "$command" $argv
end

# pyenv
set -gx PYENV_ROOT "/Users/watal/.anyenv/envs/pyenv"
set -gx PATH $PATH "/Users/watal/.anyenv/envs/pyenv/bin"
while set pyenv_index (contains -i -- "/Users/watal/.anyenv/envs/pyenv/shims" $PATH)
set -eg PATH[$pyenv_index]; end; set -e pyenv_index
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
