{
  description = "A nixvim configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    flake-utils,
    nixvim,
    neovim-nightly,
    ...
  } @ inputs: let
    useNightly = false;
  in
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
          overlays = nixpkgs.lib.optional useNightly [
            neovim-nightly.overlays.default
          ];
        };
        nixvimModule = {
          inherit system;
          module = import ./config;
          extraSpecialArgs = {
            inherit inputs;
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
