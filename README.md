# Dotfiles

# Screenshot

![openbox-patched scrot](https://user-images.githubusercontent.com/40271651/42960069-11335e0c-8b8b-11e8-96ca-be82774ff0a3.png)
> [openbox-patched]

Currently I'm using [arch linux] as my os, [openbox] as my floating window manager ([with some patches]) and [bspwm] as my tiling window manager.

# Installation

Install [stow] and then run:
```bash
git clone --depth 1 https://github.com/matteoguarda/dotfiles.git
cd dotfiles
./init.sh
```

If stow gives you any error, delete the files that make conflict with what you want to stow.
You can also just individually stow a config, e.g.:
```bash
cd dotfiles
stow -t $HOME compton
```

If you don't want anymore a config, run:
```bash
cd dotfiles
stow -D compton
```

[arch linux]: https://www.archlinux.org
[openbox]: http://openbox.org/wiki/Main_Page
[openbox-patched]: https://github.com/dylanaraps/openbox-patched
[with some patches]: https://github.com/dylanaraps/openbox-patched
[bspwm]: https://github.com/baskerville/bspwm
[stow]: https://www.gnu.org/software/stow
