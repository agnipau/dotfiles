#!/usr/bin/env sh
#
# Script to install my dotfiles. This script erases all your configs so make a backup before running it!!!
# Requires GNU stow.

# Help text
help() {
cat <<EOF
First argument must be 'laptop' (if you have a 1366x768 monitor).
First argument must be 'desktop' (if you have a 1920x1080 monitor).
If you have a different screen resolution you'll need to manually change some settings of the programs named like (<program>-desktop and <program>-laptop).
EOF
}

[ $# -eq 0 ] && help && return

read -p "==> Starting to remove all config files that would make conflict with mine... [q to quit, else to continue]" enter

[ "$enter" = "q" ] && exit 0

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
	openbox-${1} \
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
	        openbox-${1} \
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
