{
  programs.nixvim.plugins.obsidian = {
    enable = true;
    settings = {
  completion = {
    min_chars = 2;
    nvim_cmp = true;
  };
  new_notes_location = "current_dir";
  workspaces = [
    {
      name = "notes";
      path = "~/Notes";
    }
    ];
    templates = {
      subdir = "Templates";
      date_format = "%d-%m-%Y";
      time_format = "%H:%M";
      tags = "";
  };
  };
  };
}
