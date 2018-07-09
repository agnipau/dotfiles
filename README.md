# Dotfiles

# Screenshots

![openbox-patched screenshot]()
> openbox-patched

![bspwm screenshot]()
> bspwm

Currently I'm using [void linux] as my os, [openbox] as my floating window manager ([with some patches]) and [bspwm] as my tiling window manager.

# Installation

Just install [stow] and then run:

```bash
git clone --depth 1 https://github.com/matteoguarda/dotfiles.git
cd dotfiles
./init.sh
```

If stow gives you any error, delete the files that make conflict with what you want to stow.
You can also just individually stow a config, e.g.:

```bash
cd dotfiles
stow -t $HOME st
```

If you don't want anymore a config, run:
```bash
cd dotfiles
stow -D st
```

[void linux]: https://voidlinux.org
[openbox]: http://openbox.org/wiki/Main_Page
[with some patches]: https://github.com/dylanaraps/openbox-patched
[bspwm]: https://github.com/baskerville/bspwm
[2bwm]: https://github.com/venam/2bwm
[stow]: https://www.gnu.org/software/stow
