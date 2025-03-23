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
      options.desc = "Format current buffer";
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
        nix = [ "nixfmt" ];
      };
    };
  };
}
