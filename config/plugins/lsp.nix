{
  plugins.lsp = {
    enable = true;
    servers = {
      nixd.enable = true;
      jsonls.enable = true;
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
