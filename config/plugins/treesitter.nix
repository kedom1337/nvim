{
  plugins = {
    treesitter = {
      enable = true;
      settings = {
        indent.enable = true;
        highlight = {
          enable = true;
          disable = ["Dockerfile"];
        };
      };
    };
    treesitter-textobjects.enable = true;
  };
}
