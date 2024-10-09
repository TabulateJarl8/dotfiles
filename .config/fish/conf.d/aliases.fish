alias imagetobase64='xclip -selection clipboard -t image/png -o - | base64 - | xclip -selection clipboard'
alias cardtop='watch -d -n 0.5 nvidia-smi'
alias pacfind="pacman -Slq | fzf --multi --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias push-subtrees="git subtree push --prefix=squiid-engine/ squiid-engine trunk; git subtree push --prefix=squiid-parser/ squiid-parser trunk"
alias scan-qr="import -silent -window root bmp:- | zbarimg -"
