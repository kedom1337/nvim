{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ac";
      action = ":CodeCompanionChat Toggle<cr>";
      options.desc = "codecompanion: Toggle chat";
    }
    {
      mode = "n";
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
  };
}
