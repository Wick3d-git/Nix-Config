{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymapsSilent = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<C-a>";
      navFile = {
        "1" = "<leader>n";
        "2" = "<leader>e";
        "3" = "<leader>i";
        "4" = "<leader>o";
      };
    };
  };
}
