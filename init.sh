#!/usr/bin/env sh
#
# Script to install my dotfiles.

cd dotfiles || exit 1
for i in *; do stow -D "$i"; done
echo "==> Starting to create symbolic links through GNU stow..."
for i in *; do stow -t "$HOME" "$i"; done
echo "==> Finished!"
