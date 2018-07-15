function fzf-z-search
    set -l query (commandline)

    if test -n $query
      set fzf_flags --query "$query"
    end

    z -l | fzf $fzf_flags | awk '{ print $2 }' | read recent
    if [ $recent ]
        cd $recent
        commandline -r ''
        commandline -f repaint
    end
end
