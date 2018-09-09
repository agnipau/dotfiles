#!/usr/bin/env bash
#
# You need GNU Stow for installing my dotfiles. Make sure to backup everything
# because this will destroy all your dotfiles.

# UnStow all configs.
cd ./dotfiles
for config in *; do
  stow -D "$config"
done

# Remove configs that would make conflict.
rm -rf "${HOME}/.config/alacritty" \
       "${HOME}/.asoundrc" \
       "${HOME}/.bash_profile" \
       "${HOME}/.bashrc" \
       "${HOME}/.config/cava" \
       "${HOME}/.config/cmus" \
       "${HOME}/.config/compton" \
       "${HOME}/.config/dunst" \
       "${HOME}/.config/fish" \
       "${HOME}/.mpd" \
       "${HOME}/.config/mpv" \
       "${HOME}/.config/ncmpcpp" \
       "${HOME}/.config/nvim" \
       "${HOME}/.config/openbox" \
       "${HOME}/.config/polybar" \
       "${HOME}/.config/skippy-xd" \
       "${HOME}/.themes" \
       "${HOME}/.tmux.conf" \
       "${HOME}/.xinitrc" \
       "${HOME}/.Xresources" \
       "${HOME}/.config/zathura"

# Stow all configs except some system configs.
for config in *; do
  if [[ "$config" != systemd ]]; then
    stow -t "$HOME" "$config"
  fi
done
