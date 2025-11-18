{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight = {
          enable = true;
          disable = ["dockerfile"];
        };
      };
    };
    treesitter-textobjects.enable = true;
  };
}
