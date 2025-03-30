{
  description = "A nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs =
    {
      nixpkgs,
      nixvim,
      flake-parts,
      neovim-nightly,
      ...
    }@inputs:
    let
      nvimConfig = {
        useNightly = false;
      };
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      perSystem =
        { lib, system, ... }:
        let
          overlays = lib.optional nvimConfig.useNightly [ neovim-nightly.overlays.default ];
          pkgs = import nixpkgs {
            inherit system overlays;
          };
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system pkgs;
            module = import ./config;
          };
          nvim = nixvim'.makeNixvimWithModule nixvimModule;
        in
        {
          checks = {
            default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          };
          packages = {
            default = nvim;
          };
        };
    };
}
