{
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = ''
        function()
          MiniFiles.open(vim.api.nvim_buf_get_name(0))
        end
      '';
      options.desc = "mini: Open file explorer";
    }
    {
      mode = "n";
      key = "<leader>re";
      action.__raw = ''
        function()
          MiniFiles.open()
        end
      '';
      options.desc = "mini: Open file explorer at root";
    }
  ];

  plugins.mini = {
    enable = true;
    modules = {
      surround = {};
      pairs = {};
      splitjoin = {};
      move = {};
      statusline = {};
      diff = {
        view.style = "sign";
      };
      files = {
        windows.preview = true;
        options.use_as_default_explorer = false;
      };
      jump2d = {
        silent = true;
        allowed_lines.cursor_at = false;
        view.n_steps_ahead = 2;
        spotter.__raw = ''
          require('mini.jump2d').builtin_opts.word_start.spotter
        '';
      };
      ai = {
        silent = true;
        custom_textobjects = {
          f.__raw = ''
            require('mini.ai').gen_spec.treesitter({
              a = { "@function.outer" };
              i = { "@function.inner" };
            })
          '';
          o.__raw = ''
            require('mini.ai').gen_spec.treesitter({
              a = { '@conditional.outer', '@loop.outer' },
              i = { '@conditional.inner', '@loop.inner' },
            })
          '';
        };
      };
    };
  };
}
