{
  description = "A nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs =
    { nixvim, flake-parts, ... }@inputs:
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
        { pkgs, system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvim' = nixvim.legacyPackages.${system};
          nixvimModule = {
            inherit system;
            module = import ./config;
            extraSpecialArgs = {
              inherit inputs nvimConfig;
            };
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
          formatter = pkgs.nixfmt-rfc-style;
        };
    };
}
