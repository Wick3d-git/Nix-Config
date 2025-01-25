{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    tabstop = 2;
    softtabstop = 2;
    showtabline = 2;
    expandtab = true;
    showmode = false;
    clipboard = {
      providers = {
        wl-copy.enable = true; # For Wayland
        xsel.enable = true; # For X11
      };
      register = "unnamedplus";
    };
    smartindent = true;
    shiftwidth = 2;
    breakindent = true;
    hlsearch = true;
    incsearch = true;
    wrap = true;
    splitbelow = true;
    splitright = true;
    mouse = "a";
    ignorecase = true;
    smartcase = true;
    updatetime = 250;
    scrolloff = 10;
    swapfile = false;
    backup = false;
    undofile = true;
    list = true;
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
    inccommand = "split";
    cursorline = true;
    completeopt = [
      "menuone"
      "noselect"
      "noinsert"
    ];
    foldcolumn = "0";
    foldlevel = 99;
    foldlevelstart = 99;
    foldenable = true;
  };
}
