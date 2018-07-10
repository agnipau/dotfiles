#!/usr/bin/env sh
#
# Script to install my dotfiles.

for i in dotfiles/*; do stow -D "$i"; done
echo "==> Starting to create symbolic links through GNU stow..."
for i in dotfiles/*; do stow -t "$HOME" "$i"; done
echo "==> Finished!"
