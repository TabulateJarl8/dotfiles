fastfetch
set fish_greeting
eval (ssh-agent -c) > /dev/null
function clip
	cat "$argv[1]" | xclip -selection clipboard
end
function cflake
	watch -n 1 flake8 --ignore W191,E501,E266,E402,F403,E261,F405,F401,W503 "$argv[1]"
end
alias imagetobase64='xclip -selection clipboard -t image/png -o - | base64 - | xclip -selection clipboard'
alias cardtop='watch -d -n 0.5 nvidia-smi'
alias pacfind="pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias push-subtrees="git subtree push --prefix=squiid-engine/ squiid-engine trunk; git subtree push --prefix=squiid-parser/ squiid-parser trunk"
alias scan-qr="import -silent -window root bmp:- | zbarimg -"
set -gx EDITOR nvim

function asm
        if set -q argv[2]
                set nasm_debug -gdwarf
        else
                set ld_static -static
        end

        set tmpfile (mktemp)

        nasm $argv[1] -f elf64 -o "$tmpfile" $nasm_debug
        ld -o (path change-extension '' $argv[1]) "$tmpfile" $ld_static
        if not set -q argv[2]
                strip (path change-extension '' $argv[1])
        end
end
