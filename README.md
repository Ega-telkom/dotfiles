# dotfiles

Shell scripts are bloated, just use [GNU `stow`](https://www.gnu.org/software/stow/) instead to
symlink the config(s) for you.

Apply all config (order doesn't matter):
```sh
$ stow foot waybar nvim fuzzel veila niri
```

Selectively apply some config:
```sh
$ stow veila
```

Unlink the config:
```sh
$ stow -D fuzzel
```
