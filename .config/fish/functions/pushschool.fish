function pushschool
        set cwd (pwd)
        cd ~/school
        git add .
        git commit -m work
        git push
        cd "$cwd"
end
