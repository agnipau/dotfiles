#!/usr/bin/env bash
#
# Script to install my dotfiles.
# Requires GNU stow.

read -p "==> Starting to remove all the config files that would make conflict with the dotfiles that you want to install... [q to quit]" enter
[[ "$enter" == "q" ]] && exit 0

stow -D 2bwm \
	bash \
	bin \
	bspwm \
	cava \
	compton \
	dunst \
	mpv \
	neofetch \
	nvim \
	openbox \
	sent \
	slock \
	st \
	sxhkd \
	themes \
	viewnior \
	x \
	xdg-user-dirs \
	zathura \
	zsh

echo "==> Starting to create symbolic links..."

stow -t ${HOME} 2bwm \
	      bash \
	      bin \
	      bspwm \
	      cava \
	      compton \
	      dunst \
	      mpv \
	      neofetch \
	      nvim \
	      openbox \
	      sent \
	      slock \
	      st \
	      sxhkd \
	      themes \
	      viewnior \
	      x \
	      xdg-user-dirs \
	      zathura \
	      zsh

echo "==> Success!"
