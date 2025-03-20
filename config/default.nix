{
  imports = [
    ./core/autocmds.nix
    ./core/keymaps.nix
    ./core/options.nix

    ./plugins
  ];

  enableMan = true;
  viAlias = true;
  vimAlias = true;

  performance = {
    byteCompileLua = {
      enable = true;
      nvimRuntime = true;
      configs = true;
      plugins = true;
    };
  };
}
