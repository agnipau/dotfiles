#!/usr/bin/env sh
#
# Script to install my dotfiles.
# Requires GNU stow.

cd dotfiles
for i in $(ls); do stow -D $i; done
echo "==> Starting to create symbolic links through GNU stow..."
for i in $(ls); do stow -t $HOME $i; done
echo "==> Finished!"
