{
  lib,
  inputs,
  nvimConfig,
  ...
}:
{
  imports = [
    ./core/autocmds.nix
    ./core/keymaps.nix
    ./core/options.nix

    ./plugins
  ];

  nixpkgs.overlays = lib.optional nvimConfig.useNightly [
    inputs.neovim-nightly.overlays.default
  ];

  enableMan = true;
  viAlias = true;
  vimAlias = true;

  luaLoader.enable = true;
  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };
}
