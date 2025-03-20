{
  plugins.blink-cmp = {
    enable = true;
    settings = {
      appearance.use_nvim_cmp_as_default = true;
      keymap.preset = "enter";
      signature.enabled = true;
      completion = {
        documentation.auto_show = true;
        accept.auto_brackets.enabled = true;
      };
    };
  };
}
