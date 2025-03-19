{
  imports = [
    ./core/autocmds.nix
    ./core/keymaps.nix
    ./core/options.nix

    ./plugins/fzf.nix
    ./plugins/treesitter.nix
  ];

  enableMan = true;
  viAlias = true;
  vimAlias = true;
}
