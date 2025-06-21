{pkgs, ...}: {
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
        lua = ["stylua"];
        python = ["black"];
        rust = ["rustfmt"];
        javascript = ["prettier"];
        typescript = ["prettier"];
        typescriptreact = ["prettier"];
        astro = ["prettier"];
        json = ["prettier"];
        nix = ["alejandra"];
      };
    };
  };

  extraPackages = with pkgs; [
    stylua
    black
    rustfmt
    prettier
    alejandra
  ];
}
