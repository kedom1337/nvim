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
      stop_after_first = true;
      formatters_by_ft = {
        "_" = {
          __unkeyed-1 = "trim_whitespace";
          __unkeyed-2 = "trim_newlines";
          __unkeyed-3 = "squeeze_blanks";
          stop_after_first = false;
        };
        python = ["ruff_format"];
        rust = ["rustfmt"];
        javascript = ["prettier" "oxfmt"];
        typescript = ["prettier" "oxfmt"];
        typescriptreact = ["prettier" "oxfmt"];
        astro = ["prettier" "oxfmt"];
        json = ["prettier" "oxfmt"];
        yaml = ["prettier" "oxfmt"];
        nix = ["alejandra"];
        ocaml = ["ocamlformat"];
      };
    };
  };
}
