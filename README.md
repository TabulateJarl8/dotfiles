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
sudo pacman -Sy lldb ripgrep stylua ruff astyle git --needed
```
