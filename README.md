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

Install Arch dependencies:

```sh
sudo pacman -Sy ripgrep git texlive biber python-pygments cargo-nextest --needed fd
```

If running X11, install `xclip`, if running wayland, install `wl-clipboard`.

Optionally, install the following AUR dependencies:

```sh
paru -S marp-cli-bin
```

On first launch of nvim, rebuild the silicon themes:

```
:lua require('silicon').rebuild_themes()
```
