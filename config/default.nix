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

  luaLoader.enable = true;
}
