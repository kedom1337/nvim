{
  keymaps = [
    {
      mode = "n";
      key = "<leader>l";
      action.__raw = ''
        function()
          require("conform").format()
        end
      '';
      options.desc = "conform: Format current buffer";
    }
  ];

  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        "_" = [
          "trim_whitespace"
          "trim_newlines"
          "squeeze_blanks"
        ];
        lua = [ "stylua" ];
        python = [ "black" ];
        rust = [ "rustfmt" ];
        javascript = [ "prettierd" ];
        typescript = [ "prettierd" ];
        typescriptreact = [ "prettierd" ];
        astro = [ "prettierd" ];
        json = [ "prettierd" ];
        nix = [ "nixfmt" ];
      };
      format_on_save.__raw = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 200, lsp_fallback = true }
        end
      '';
    };
  };
}
