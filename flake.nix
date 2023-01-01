{
  description = "Torch Sandbox";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    devenv.url = "github:cachix/devenv";
  };

  outputs = { nixpkgs, devenv, ... }@inputs: {
    devShells = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.unix (system:
      {
        default = devenv.lib.mkShell {
          inherit inputs;
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          modules = [
            ./modules/base.nix
            ./modules/python.nix
          ];
        };
      }
    );
  };
}
