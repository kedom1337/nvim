{
  keymaps = [
    {
      mode = "n";
      key = "<leader>aC";
      action = ":AvanteClear<cr>";
      options.desc = "avante: clear chat history";
    }
  ];

  plugins.avante = {
    enable = true;
    settings = {
      provider = "copilot";
    };
  };
}
