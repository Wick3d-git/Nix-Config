{ config, ...}: 
let 
  wallpapers_dir = "${config.xdg.userDirs.download}/Wallpapers";
in
{
  services.hyprpaper = {
	enable = true;
	settings = {
	  splash = false;
	  preload = [ ''${wallpapers_dir}/bg2.png'' ]; 
	  wallpaper = [
	    ''DP-3,${wallpapers_dir}/bg2.png''
	    ''HDMI-A-1,${wallpapers_dir}/bg2.png''
	  ];
	};
  };
}
