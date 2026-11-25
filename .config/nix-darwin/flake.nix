{
  description = "Johannes' Mac config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix-darwin, ... }: {
    # Same config on every Mac:
    #   sudo darwin-rebuild switch --flake ~/.config/nix-darwin#mbp
    darwinConfigurations.mbp = nix-darwin.lib.darwinSystem {
      modules = [
        ./configuration.nix
        { system.configurationRevision = self.rev or self.dirtyRev or null; }
      ];
    };
  };
}
