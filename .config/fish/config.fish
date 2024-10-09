if [ "$hostname" = "xenon" ]
        fastfetch
end

set fish_greeting
eval (ssh-agent -c) > /dev/null
set -gx EDITOR nvim

