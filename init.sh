#!/usr/bin/env sh
#
# Script to install my dotfiles. This script erases all your configs so make a backup before running it!!!
# Requires GNU stow.

[ $# -eq 0 ] && help && return

read -p "==> Starting to remove all config files that would make conflict with mine... [q to quit, else to continue]" enter

[ "$enter" = "q" ] && exit 0

stow -D alsa \
        2bwm \
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
	zathura

echo "==> Starting to create symbolic links..."

stow -t ${HOME} alsa \
                2bwm \
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
	        zathura

echo "==> Finished!"
