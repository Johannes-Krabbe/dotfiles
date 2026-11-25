{ pkgs, ... }:

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

  # oh-my-zsh + powerlevel10k in ~/.zshrc already handle completion and the prompt.
  programs.zsh = {
    enable = true;
    enableCompletion = false;
    promptInit = "";
  };

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
