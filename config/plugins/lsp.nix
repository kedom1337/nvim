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
    {
      mode = "n";
      key = "<leader>ttl";
      action = lib.nixvim.mkRaw ''
        function()
          local tsgo_clients = vim.lsp.get_clients({ name = 'tsgo' })
          local vtsls_clients = vim.lsp.get_clients({ name = 'vtsls' })

          if #tsgo_clients > 0 then
            vim.lsp.enable('tsgo', false)
            vim.lsp.enable('vtsls')
            vim.notify('Switched to vtsls', vim.log.levels.INFO)
          elseif #vtsls_clients > 0 then
            vim.lsp.enable('vtsls', false)
            vim.lsp.enable('tsgo')
            vim.notify('Switched to tsgo', vim.log.levels.INFO)
          end
        end
      '';
      options.desc = "Toggle TypeScript LSP (tsgo/vtsls)";
    }
  ];

  plugins.lspconfig.enable = true;
  lsp.servers = {
    nixd.enable = true;
    jsonls.enable = true;
    yamlls.enable = true;
    tailwindcss.enable = true;
    eslint.enable = true;
    oxlint.enable = true;
    ocamllsp.enable = true;
    dockerls.enable = true;
    helm_ls.enable = true;
    tofu_ls.enable = true;
    tsgo.enable = true;
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
