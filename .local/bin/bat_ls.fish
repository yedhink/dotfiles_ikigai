if test -z "$argv"
    eza -l -h --color always --color-scale --sort=modified --no-permissions --no-user "."
else
    for file in $argv
        echo $file
        if test -d $file
            eza -l -h --color always --color-scale --sort=modified --no-permissions --no-user $file
        else if test -f $file
            bat --color=always --style=header,grid --line-range :300 $file
        end
    end
end
