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

  plugins = {
    ts-autotag.enable = true;
    ts-comments.enable = true;
    dressing.enable = true;
    fidget.enable = true;
    gitsigns.enable = true;
  };
}
