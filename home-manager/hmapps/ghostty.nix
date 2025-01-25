{
  programs.ghostty = {
    enable = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      theme = "nord";
      font-size = 14;
      window-padding-x = 0;
      window-padding-y = 0;
      window-padding-balance = true;
      window-padding-color = "extend";
      window-decoration = false;
      confirm-close-surface = false;
    };
  };
}
