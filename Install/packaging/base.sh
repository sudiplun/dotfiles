# install base pacman
mapfile -t packages < <(grep -v '^#' "~/.local/share/dotfiles/Install/base.packages" | grep -v '^$')
sudo pacman -S --noconfirm --needed "${packages[@]}"
