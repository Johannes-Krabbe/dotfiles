{ pkgs, config, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Determinate Nix manages the Nix installation and daemon itself.
  nix.enable = false;

  system.primaryUser = "johanneskrabbe";

  # ── CLI tools ────────────────────────────────────────────────
  environment.systemPackages = with pkgs; [
    biome
    bun
    cowsay
    fastfetch
    gh
    git
    jq
    lolcat
    mas
    mise
    neovim
    ripgrep
    tmux
    tree-sitter
    yadm
    zoxide
  ];

  # ── Shell ────────────────────────────────────────────────────
  programs.zsh = {
    enable = true;
    enableCompletion = true; # runs compinit in /etc/zshrc
    promptInit = "";         # powerlevel10k sets the prompt
  };

  # Theme + plugins, loaded from ~/.zshrc with `source /etc/zsh-plugins.zsh`
  environment.etc."zsh-plugins.zsh".text = ''
    source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
    source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source ${pkgs.zsh-f-sy-h}/share/zsh/site-functions/F-Sy-H.plugin.zsh
  '';

  # Install the tools in ~/.config/mise/config.toml (e.g. node) on every rebuild.
  system.activationScripts.postActivation.text = ''
    echo >&2 "installing mise tools..."
    sudo --user=${config.system.primaryUser} --set-home -- ${pkgs.mise}/bin/mise install --yes \
      || echo >&2 "warning: mise install failed"
  '';

  # ── Apps (installed by Homebrew, declared here) ──────────────
  homebrew = {
    enable = true;
    onActivation = {
      # "none": leaves anything not listed below alone.
      # "uninstall": removes every brew formula/cask not listed below.
      cleanup = "none";
    };

    taps = [
      "johannes-krabbe/tap"
    ];

    casks = [
      "1password"
      "1password-cli"
      "beekeeper-studio"
      "docker-desktop"
      "gcloud-cli"
      "ghostty"
      "helium-browser"
      "notion-calendar"
      "raycast"
      "slack"
      "spotify"
      "tectr"
      "tunnelblick"
      "yaak"
      "zoom"
    ];

    # Needs you to be signed in to the App Store.
    masApps = {
      Xcode = 497799835;
    };
  };

  # ── macOS settings ───────────────────────────────────────────
  system.defaults = {
    dock = {
      autohide = true;
      tilesize = 16;
      show-recents = false;
    };
    NSGlobalDomain = {
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false;
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = true;
      "com.apple.swipescrolldirection" = true;
    };
  };

  system.stateVersion = 6;
}
