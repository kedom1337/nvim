{
  description = "A nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    nixpkgs,
    nixvim,
    flake-utils,
    neovim-nightly,
    ...
  } @ inputs:
    flake-utils.lib.eachDefaultSystem (
      system: let
        nvimConfig = {
          useNightly = false;
        };
        pkgs = import nixpkgs {
          inherit system;
          overlays = nixpkgs.lib.optional nvimConfig.useNightly [
            neovim-nightly.overlays.default
          ];
        };
        nixvimModule = {
          inherit system;
          module = import ./config;
          extraSpecialArgs = {
            inherit inputs nvimConfig;
          };
        };
      in {
        packages = {
          default = nixvim.legacyPackages.${system}.makeNixvimWithModule nixvimModule;
        };
        checks = {
          default = nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule nixvimModule;
        };
        formatter = pkgs.alejandra;
      }
    );
}
