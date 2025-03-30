{
  imports = [
    ./blink.nix
    ./fzf.nix
    ./lsp.nix
    ./mini.nix
    ./treesitter.nix
    ./copilot.nix
    ./snacks.nix
    ./conform.nix
    ./schemastore.nix
    ./avante.nix
    ./markdown.nix
    ./dap.nix
    ./highlight.nix
  ];

  plugins = {
    ts-autotag.enable = true;
    ts-comments.enable = true;
    dressing.enable = true;
    fidget.enable = true;
    gitsigns.enable = true;
    web-devicons.enable = true;
  };
}
