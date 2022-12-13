{
  description = "Torch Sandbox";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-22.11";

  outputs = { self, nixpkgs, ... }: {
    devShell = nixpkgs.lib.genAttrs nixpkgs.lib.platforms.unix (system:
      with import nixpkgs { inherit system; config.allowUnfree = true; };
      callPackage ./shell.nix { }
    );
  };
}
