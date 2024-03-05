{
  programs.nixvim = {
    plugins.copilot-lua = {
      enable = true;
      panel = {
        enabled = false;
        autoRefresh = true;
        keymap = {
          jumpPrev = "[[";
          jumpNext = "]]";
          accept = "<CR>";
          refresh = "gr";
          open = "<M-CR>";
        };
        layout = {
          position = "bottom"; # | top | left | right
          ratio = 0.4;
        };
      };
      suggestion = {
        enabled = false;
        autoTrigger = true;
        debounce = 75;
        keymap = {
          accept = "<M-l>";
          acceptWord = false;
          acceptLine = false;
          next = "<M-]>";
          prev = "<M-[>";
          dismiss = "<C-]>";
        };
      };
      filetypes = { "*" = true; };
      copilotNodeCommand = "node"; # Node.js version must be > 18.x
      serverOptsOverrides = { };
    };
  };
}
