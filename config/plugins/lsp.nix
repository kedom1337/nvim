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
      tailwindcss.enable = true;
      eslint.enable = true;
      vtsls = {
        enable = true;
        settings = {
          typescript.tsserver.maxTsServerMemory = 12288;
          vtsls.experimental.completion.enableServerSideFuzzyMatch = true;
          vtsls.experimental.completion.entriesLimit = 5;
        };
      };
    };
  };
}
