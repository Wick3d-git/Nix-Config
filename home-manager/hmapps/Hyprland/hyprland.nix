{
  pkgs,
  config,
  inputs,
  ...
}: 
let
  dir = "${config.home.homeDirectory}";
in

{
  wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      settings = {
        "$term" = "${pkgs.ghostty}/bin/ghostty";
        "$fileManager" = "${pkgs.nautilus}/bin/nautilus";
        "$menu" = "${pkgs.rofi-wayland}/bin/rofi -show drun";
        "$cliFM" = "$term -e ${pkgs.yazi}/bin/yazi";
        exec-once = [
	  "${pkgs.hyprshade}/bin/hyprshade on vibrance"
	  "pypr &"
	  "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
	];
	monitor = [
	  "DP-3, 2560x1440@170, 1920x0, 1"
	  "HDMI-A-1, 1920x1080@240, 0x0, 1"
        ];
        general = {
          gaps_in = 2;
          gaps_out = 9;
          border_size = 2;
          resize_on_border = false;
          allow_tearing = false;
          layout = "dwindle";
        };
        decoration = {
          rounding = 10;
          active_opacity = 1.0;
          inactive_opacity = 1.0;
          blur = {
            enabled = true;
            size = 3;
            passes = 1;
            vibrancy = 0.1696;
          };
        };
	animations = {
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1,7, myBezier"
          "windowsOut, 1,7, default, popin 80%"
          "border, 1,7, default"
          "borderangle, 1,8, default"
          "fade, 1,7, default"
          "workspaces, 1,7, default"
        ];
      };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };
        input = {
          kb_layout = "us";
          mouse_refocus = 0;
          accel_profile = "flat";
          follow_mouse = 1;
          sensitivity = 0;
          touchpad = {
            natural_scroll = false;
          };
        };
	"$MOD" = "SUPER";
	bind = [ 
	  "SUPER, Return, exec, $term"
	  "SUPER, C, killactive,"
	  "SUPER, P, exec, wlogout --protocol layer-shell -b 5 -T 400 -B 400"
	  "SUPER_SHIFT, Q, exit"
	  "SUPER, Space, togglefloating,"
	  "SUPER, F, fullscreen,"
	  "CTRL_ALT, L, exec, hyprlock"
	  "SUPER, D, exec, killall $menu || $menu "
	  "SUPER, E, exec, $fileManager"
	  "SUPER,TAB, cyclenext,"
	  "SUPER_SHIFT, P, pseudo,"
	  "SUPER, S, togglesplit,"
	  "SUPER, H, movefocus, l"
	  "SUPER, L, movefocus, r"
	  "SUPER, J, movefocus, u"
	  "SUPER, k, movefocus, d"
	  "SUPER_SHIFT, left, movewindow, l"
	  "SUPER_SHIFT, right, movewindow, r"
	  "SUPER_SHIFT, down, movewindow, d"
	  "SUPER_CTRL, left, resizeactive, -20 0"
	  "SUPER_CTRL, right, resizeactive, 20 0"
	  "SUPER_CTRL, up, resizeactive, 0 -20"
	  "SUPER_CTRL, down, resizeactive, 0 20"
	  "SUPER, G, togglegroup"
	  "SUPER_SHIFT, return, exec, pypr toggle term && hyprctl dispatch bringactivetotop"
	  "SUPER, r, exec, pypr toggle ranger && hyprctl dispatch bringactivetotop"
	  "SUPER, v, exec, pypr toggle volume && hyprctl dispatch bringactivetotop"
	]
	    ++ (builtins.concatLists (
          builtins.genList (
            i: let
              ws = i + 1;
            in [
              "$MOD, code:1${toString i}, workspace, ${toString ws}"
              "$MOD SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9
        ));
      bindm = [
        "$MOD, mouse:272, movewindow"
        "$MOD, mouse:273, resizewindow"
      ];
      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];
      bindl = [
	      " ,XF86AudioNext, exec, playerctl next"
	      ",XF86AudioPause, exec, playerctl play-pause"
	      ",XF86AudioPlay, exec, playerctl play-pause"
	      ",XF86AudioPrev, exec, playerctl previous"
      ];
	"$scratchpadsize" = "size 60% 65%";
 	"$scratchpad" = "class:^(scratchpad.foo)$";
       windowrulev2 = [
          "float,$scratchpad"
          "$scratchpadsize,$scratchpad"
          "workspace special silent,$scratchpad"
	];
        workspace = [
	  "1, monitor:DP-3"
	  "2, monitor:DP-3"
	  "3, monitor:DP-3"
	  "4, monitor:DP-3"
	  "5, monitor:DP-3"
	  "6, monitor:HDMI-A-1"
	  "7, monitor:HDMI-A-1"
	  "8, monitor:HDMI-A-1"
	  "9, monitor:HDMI-A-1"
	  "10, monitor:HDMI-A-1"
	];

      };
    };
}

