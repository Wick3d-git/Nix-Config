{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [ ];
  services.dunst = {
    enable = true;
    settings = {
     global = {
       follow = "mouse";
       indicate_hidden = "yes";

       offset = "10x5";

       separator_height = 2;

       padding = 8;
       horizontal_padding = 8;
       text_icon_padding = 0;
       frame_width = 2;

       frame_color = "#4c566a";
       separator_color = "frame";

       sort = "yes";
       idle_threshold = 120;
       font = "JetBrainsMono Nerd Font 12";
       line_height = 0;
       markup = "full";
       alignment = "left";
       vertical_alignment = "center";
       show_age_threshold = 60;
       word_wrap = "yes";
       stack_duplicates = true;
       hide_duplicate_count = false;

       show_indicators = "yes";
       min_icon_size = 0;
       max_icon_size = 64;

       title = "Dunst";
       class = "Dunst";

       corner_radius = 10;
       timeout = 5;
       };
       urgency_low = {
          background = "#2e3440";
          foreground = "#ffffff";
       };
       urgency_normal = {
          background = "#3b4252";
          foreground = "#ffffff";
       };
       urgency_critical = {
          background = "#4c566a";
          foreground = "#ffffff";
          frame_color = "#2e3440";
       };
    };
  };
}
