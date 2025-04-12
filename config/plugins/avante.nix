{
  keymaps = [
    {
      mode = "n";
      key = "<leader>ac";
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
