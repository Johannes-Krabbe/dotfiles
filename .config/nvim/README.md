# NVIM

The latest version is most likely the one im currently using.
Whenever I feel like it makes sense to set up nvim from scratch I create a completely new version.

# Setup script
add the `nvim-launcher.sh` to the .zshrc like this: 
```
alias n="~/.config/nvim/nvim-launcher.sh"
```

in order to open neovim with different configs, you can now use the `--config` or the `-c` flag like this:
```
n -c v1
```

the script will always default to the latest version
