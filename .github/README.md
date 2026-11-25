# dotfiles

My Mac setup: dotfiles managed with [yadm](https://yadm.io), packages, apps and macOS settings with [nix-darwin](https://github.com/nix-darwin/nix-darwin) (config in [`.config/nix-darwin`](../.config/nix-darwin)).

## New Mac

**1. Before anything else**
- Sign in to the App Store (needed for Xcode) and 1Password

```sh
xcode-select --install
```

**2. Install Nix**

```sh
curl -fsSL https://install.determinate.systems/nix | sh -s -- install
```

**3. Install Homebrew** (nix-darwin uses it for the apps)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

**4. Clone the dotfiles** (open a new terminal first)

```sh
nix run nixpkgs#yadm -- clone https://github.com/Johannes-Krabbe/dotfiles.git
```

**5. Apply the config.** Installs all CLI tools, apps, the zsh theme and plugins, Node (via mise) and macOS settings.

```sh
sudo nix run nix-darwin/master#darwin-rebuild -- switch --flake ~/.config/nix-darwin#mbp
```

If it refuses because `/etc/zshrc` (or `zshenv`, `zprofile`, `bashrc`) already exists, rename it and run step 5 again:

```sh
sudo mv /etc/zshrc /etc/zshrc.before-nix-darwin
```

**6. Switch the dotfiles remote to SSH** (after setting up the 1Password SSH agent)

```sh
yadm remote set-url origin git@github.com:Johannes-Krabbe/dotfiles.git
```

**7. Things Nix doesn't do**
- Log in to gh, gcloud and the apps
- Import Raycast settings

## Everyday use

Apply changes after editing `~/.config/nix-darwin/configuration.nix`:

```sh
sudo darwin-rebuild switch --flake ~/.config/nix-darwin#mbp
```

Update all Nix packages (then apply, and commit `flake.lock`):

```sh
nix flake update --flake ~/.config/nix-darwin
```

Undo the last change:

```sh
sudo darwin-rebuild --rollback
```

Find package names:

```sh
nix search nixpkgs <name>     # CLI tools  → environment.systemPackages
brew search --cask <name>     # apps       → homebrew.casks
```
