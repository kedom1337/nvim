{
  description = "A nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs =
    {
      nixpkgs,
      nixvim,
      flake-utils,
      ...
    }@inputs:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        nvimConfig = {
          useNightly = false;
        };

        pkgs = nixpkgs.legacyPackages.${system};
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};
        nixvimModule = {
          inherit system;
          module = import ./config;
          extraSpecialArgs = {
            inherit inputs nvimConfig;
          };
        };
      in
      {
        packages = {
          default = nixvim'.makeNixvimWithModule nixvimModule;
        };
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };
        formatter = pkgs.nixfmt-rfc-style;
      }
    );
}
