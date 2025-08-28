{
  keymaps = [
    {
      mode = "n";
      key = "<leader>cd";
      action = ":Copilot disable<cr>";
      options.desc = "Disable GitHub Copilot";
    }
    {
      mode = "n";
      key = "<leader>ce";
      action = ":Copilot enable<cr>";
      options.desc = "Enable GitHub Copilot";
    }
  ];

  plugins.copilot-lua = {
    enable = true;
    settings = {
      suggestion.auto_trigger = true;
    };
  };
}
