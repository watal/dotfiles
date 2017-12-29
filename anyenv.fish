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

 #goenv
set -x GOENV_ROOT "/usr/local/Cellar/anyenv/3cb8ad1/envs/goenv"
set -x PATH $PATH "/usr/local/Cellar/anyenv/3cb8ad1/envs/goenv/bin"
set -gx PATH '/usr/local/Cellar/anyenv/3cb8ad1/envs/goenv/shims' $PATH
command goenv rehash 2>/dev/null

# ndenv
set -x NDENV_ROOT "/usr/local/Cellar/anyenv/3cb8ad1/envs/ndenv"
set -x PATH $PATH "/usr/local/Cellar/anyenv/3cb8ad1/envs/ndenv/bin"
set -gx PATH '/usr/local/Cellar/anyenv/3cb8ad1/envs/ndenv/shims' $PATH
command ndenv rehash 2>/dev/null
function ndenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    source (ndenv "sh-$command" $argv|psub)
  case '*'
    command ndenv "$command" $argv
  end
end

# jenv
set -x JENV_ROOT "/usr/local/Cellar/anyenv/3cb8ad1/envs/jenv"
set -x PATH $PATH "/usr/local/Cellar/anyenv/3cb8ad1/envs/jenv/bin"
set -gx PATH '/usr/local/Cellar/anyenv/3cb8ad1/envs/jenv/shims' $PATH
command jenv rehash 2>/dev/null
set -x JENV_LOADED 1
set -e JAVA_HOME
function jenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case enable-plugin rehash shell shell-options
    source (jenv "sh-$command" $argv|psub)
  case '*'
    command jenv "$command" $argv
  end
end

# luaenv
set -x LUAENV_ROOT "/usr/local/Cellar/anyenv/3cb8ad1/envs/luaenv"
set -x PATH $PATH "/usr/local/Cellar/anyenv/3cb8ad1/envs/luaenv/bin"
set -gx PATH '/usr/local/Cellar/anyenv/3cb8ad1/envs/luaenv/shims' $PATH
set -gx LUAENV_SHELL fish
luaenv rehash 2>/dev/null
function luaenv
  set command $argv[1]
  set -e argv[1]

  switch "$command"
  case rehash shell
    eval (luaenv "sh-$command" $argv)
  case '*'
    command luaenv "$command" $argv
  end
end
