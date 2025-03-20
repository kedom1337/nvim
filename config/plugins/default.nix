{
  imports = [
    ./blink.nix
    ./fzf.nix
    ./lsp.nix
    ./mini.nix
    ./treesitter.nix
    ./copilot.nix
    ./snacks.nix
  ];

  plugins.ts-autotag.enable = true;
  plugins.ts-comments.enable = true;
  plugins.dressing.enable = true;
  plugins.fidget.enable = true;
  plugins.gitsigns.enable = true;
}
