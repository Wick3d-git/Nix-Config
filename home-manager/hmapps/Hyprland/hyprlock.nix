#  _                      _            _    
# | |__  _   _ _ __  _ __| | ___   ___| | __
# | '_ \| | | | '_ \| '__| |/ _ \ / __| |/ /
# | | | | |_| | |_) | |  | | (_) | (__|   < 
# |_| |_|\__, | .__/|_|  |_|\___/ \___|_|\_\
#        |___/|_|                           
# 
{ config, ... }:
let 
  dir = "${config.home.homeDirectory}";
in
{
  programs.hyprlock = {
  enable = true;
  settings  = { 

  label = [
   {
      monitor = "";
      text = "cmd[update:1000] echo \"$TIME\"";
      font_size = 55;
      font_family = "JetBrainsMono Nerd Font";
      position = "0, 120";
      halign = "center";
      valign = "bottom";
      shadow_passes = 5;
      shadow_size = 10;
   }
   {
    monitor = "";
      text = "$USER";
      color = "rgba(200, 200, 200, 1.0)";
      font_size = 20;
      font_family = "JetBrainsMono Nerd Font";
      position = "0, 80";
      halign = "center";
      valign = "bottom";
      shadow_passes = 5;
      shadow_size = 10;
   }
  ];
 };
 };
}

