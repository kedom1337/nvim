{
  keymaps = [
    {
      mode = "n";
      key = "<leader>i";
      action.__raw = ''
        vim.diagnostic.open_float
      '';
      options.desc = "Show diagnostics under cursor";
    }
  ];

  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      jsonls.enable = true;
      yamlls.enable = true;
      vtsls = {
        enable = true;
        extraOptions = {
          typescript.tsserver.maxTsServerMemory = 12288;
          experimental.completion.entriesLimit = 3;
        };
      };
    };
  };
}
