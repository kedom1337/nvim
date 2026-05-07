{
  lib,
  pkgs,
  ...
}: {
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
      key = "<leader>rl";
      action = lib.nixvim.mkRaw ''
        function()
          vim.cmd("lsp restart")
          vim.cmd("bufdo e")
        end
      '';
      options.desc = "Restart LSP and reload all buffers";
    }
  ];

  plugins.lspconfig.enable = true;
  lsp.servers = {
    nixd.enable = true;
    jsonls.enable = true;
    yamlls.enable = true;
    tailwindcss.enable = true;
    dockerls.enable = true;
    helm_ls.enable = true;
    tofu_ls.enable = true;
    astro = {
      enable = true;
      # The Nix astro-language-server package does not expose TypeScript in
      # Node's module resolution path, but astro-ls requires("typescript") at
      # startup and also requires a TypeScript SDK path during initialization.
      config = {
        cmd_env.NODE_PATH = lib.makeSearchPath "lib/node_modules" [pkgs.typescript];
        init_options.typescript.tsdk = "${pkgs.typescript}/lib/node_modules/typescript/lib";
      };
    };
    tsgo.enable = true;
  };
}
