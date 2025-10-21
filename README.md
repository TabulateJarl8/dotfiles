# dotfiles

To install these dotfiles, simply clone the repo with

```sh
git clone git@github.com:TabulateJarl8/dotfiles.git
```

Then, install with GNU stow:

```sh
cd dotfiles
stow .
```

## Neovim

Install Arch dependencies:

```sh
sudo pacman -Sy neovim ripgrep git texlive biber python-pygments cargo-nextest silicon fd --needed
```

If running X11, install `xclip`, if running wayland, install `wl-clipboard`.

Optionally, install the following AUR dependencies:

```sh
paru -S marp-cli-bin
```

Set the terminal's font to be a nerd font such as "Sauce Code Pro":

```
sudo pacman -Sy ttf-sourcecodepro-nerd
```

On first launch of nvim, rebuild the silicon themes:

```
:lua require('silicon').rebuild_themes()
```

### LSP Dependencies

### Various
```sh
sudo pacman -Sy npm
```

### Ruby
```sh
sudo pacman -Sy ruby-bundler ruby-debug --needed
```

### Go
```sh
sudo pacman -Sy go
```

### Haskell
```sh
paru -S ghcup-hs-bin
ghcup install ghc --set
fish_add_path ~/.ghcup/bin/
```
