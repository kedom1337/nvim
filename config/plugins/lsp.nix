{lib, ...}: {
  keymaps = [
    {
      mode = "n";
      key = "<leader>i";
      action = lib.nixvim.mkRaw ''
        vim.diagnostic.open_float
      '';
      options.desc = "Show diagnostics under cursor";
    }
  ];

  plugins.lspconfig.enable = true;
  lsp.servers = {
    nixd.enable = true;
    jsonls.enable = true;
    yamlls.enable = true;
    tailwindcss.enable = true;
    oxlint.enable = true;
    dockerls.enable = true;
    helm_ls.enable = true;
    tofu_ls.enable = true;
    astro.enable = true;
    vtsls = {
      enable = true;
      activate = false;
      config.settings = {
        typescript.tsserver.maxTsServerMemory = 12288;
        vtsls.autoUseWorkspaceTsdk = true;
      };
    };
  };
}
