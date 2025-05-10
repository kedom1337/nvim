{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ac";
      action = ":CodeCompanionChat Toggle<cr>";
      options.desc = "codecompanion: Toggle chat";
    }
    {
      mode = "v";
      key = "<leader>ai";
      action = ":CodeCompanion<cr>";
      options.desc = "codecompanion: Open inline assistant";
    }
    {
      mode = "n";
      key = "<leader>aa";
      action = ":CodeCompanionActions<cr>";
      options.desc = "codecompanion: Open action palette";
    }
  ];

  plugins.codecompanion = {
    enable = true;
    settings = {
      display = {
        action_palette.provider = "snacks";
        chat.window.opts.number = false;
      };
    };
  };
}
