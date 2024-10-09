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
