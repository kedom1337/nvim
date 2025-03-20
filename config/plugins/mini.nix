{
  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = {
        __raw = ''
          function()
            MiniFiles.open()
          end
        '';
      };
      options.desc = "Open file explorer";
    }
  ];

  plugins.mini = {
    enable = true;
    modules = {
      surround = { };
      pairs = { };
      splitjoin = { };
      move = { };
      statusline = { };
      files = {
        options.use_as_default_explorer = false;
        windows.preview = true;
      };
      jump2d = {
        allowed_lines.cursor_at = false;
        view.n_steps_ahead = 2;
        silent = true;
      };
    };
  };
}
