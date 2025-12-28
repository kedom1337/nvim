{
  keymaps = [
    {
      mode = "n";
      key = "<leader>l";
      action.__raw = ''
        function()
          require("conform").format({ async = true })
        end
      '';
      options.desc = "conform: Format current buffer";
    }
  ];

  plugins.conform-nvim = {
    enable = true;
    autoInstall.enable = true;
    settings = {
      formatters_by_ft = {
        "_" = [
          "trim_whitespace"
          "trim_newlines"
          "squeeze_blanks"
        ];
        python = ["ruff_format"];
        rust = ["rustfmt"];
        javascript = ["prettier"];
        typescript = ["prettier"];
        typescriptreact = ["prettier"];
        astro = ["prettier"];
        json = ["prettier"];
        yaml = ["prettier"];
        nix = ["alejandra"];
        ocaml = ["ocamlformat"];
      };
    };
  };
}
