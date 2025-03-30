{
  withNodeJs = false;
  withPerl = false;
  withPython3 = false;
  withRuby = false;

  colorschemes.oxocarbon.enable = true;
  clipboard.providers.xclip.enable = true;

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    number = true;
    numberwidth = 2;

    cursorline = true;
    colorcolumn = "85,120";
    signcolumn = "yes";

    laststatus = 3;
    showmode = false;
    winborder = "single";

    wrap = false;
    scrolloff = 10;
    pumheight = 10;
    smoothscroll = true;

    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
    };

    mouse = "a";
    clipboard = "unnamedplus";

    splitkeep = "screen";
    inccommand = "split";
    splitbelow = true;
    splitright = true;

    smartindent = true;
    expandtab = true;
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;

    ignorecase = true;
    smartcase = true;
    incsearch = true;
    infercase = true;

    spelllang = "en,de";
    swapfile = false;
  };
}
