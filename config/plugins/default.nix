{
  imports = [
    ./blink.nix
    ./lsp.nix
    ./mini.nix
    ./treesitter.nix
    ./copilot.nix
    ./snacks.nix
    ./conform.nix
    ./schemastore.nix
    ./markdown.nix
    ./dap.nix
    ./codecompanion.nix
  ];

  plugins = {
    ts-autotag.enable = true;
    fidget.enable = true;
    gitsigns.enable = true;
    highlight-colors.enable = true;
    web-devicons.enable = true;
  };
}
