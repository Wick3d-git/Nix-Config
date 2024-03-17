{
  xdg.configFile."hypr/hyprland.conf".text = # bash
    ''
      monitor=DP-3,2560x1440@170,0x0,1
      monitor=HDMI-A-1,1920x1080@240,-2560x0,1,transform,1
      exec-once = swaybg -o DP-3 -i /home/wick3d/Downloads/bg1.png 
      exec-once = swaybg -o HDMI-A-1 -i /home/wick3d/Downloads/bg1.png -m center
      exec-once = sleep 0.5 && waybar
      exec-once = pypr
      input {
        kb_layout = us
        accel_profile = flat
        follow_mouse = 1
        mouse_refocus = 0
        sensitivity = 0
      }

      general {
        gaps_in = 2 
        gaps_out = 9 
        border_size = 2 
        col.inactive_border = rgba(2e344040) 
        col.active_border = rgb(ffffff)
        layout = dwindle
        apply_sens_to_raw = yes 
      }

      decoration {
        rounding = 4
        active_opacity = 1.0 
        inactive_opacity = 1.0 
        drop_shadow = no 
        shadow_ignore_window = yes  
        shadow_offset = 2 2 
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = 0x66000000
      }

      animations {
        enabled = yes
        bezier = overshot, 0.13, 0.99, 0.29, 1.1
        animation = windows, 1, 4, overshot,slide 
        animation = border, 1, 10, default
        animation = fade, 1, 10, default
        animation = workspaces, 1, 6, overshot, slidevert
      }

      dwindle {
        preserve_split = yes
        pseudotile = yes 
        no_gaps_when_only = no
        special_scale_factor = 1
      }

      binds {
        allow_workspace_cycles = yes
      }

      bind = SUPER, Return, exec, kitty
      bind = SUPER, C, killactive,
      bind = SUPER, P, exec, wlogout --protocol layer-shell -b 5 -T 400 -B 400
      bind = SUPER_SHIFT, Q, exit
      bind = SUPER, Space, togglefloating,
      bind = SUPER, F, fullscreen,
      bind = CTRL_ALT, L, exec, swaylock -i ~/Downloads/bg1.png 
      bind = SUPER, D, exec, killall rofi || rofi -show drun 
      bind = SUPER, E, exec, pcmanfm
      bind = SUPER,TAB, cyclenext,
      bind = SUPER_SHIFT, P, pseudo, 
      bind = SUPER, S, togglesplit,
      bind = SUPER, H, movefocus, l 
      bind = SUPER, L, movefocus, r 
      bind = SUPER, J, movefocus, u 
      bind = SUPER, k, movefocus, d 
      bind = SUPER_SHIFT, left, movewindow, l 
      bind = SUPER_SHIFT, right, movewindow, r 
      bind = SUPER_SHIFT, up, movewindow, u 
      bind = SUPER_SHIFT, down, movewindow, d
      binde = SUPER_CTRL, left, resizeactive, -20 0 
      binde = SUPER_CTRL, right, resizeactive, 20 0 
      binde = SUPER_CTRL, up, resizeactive, 0 -20 
      binde = SUPER_CTRL, down, resizeactive, 0 20 
      bind = SUPER, G, togglegroup
      bind = SUPER_SHIFT, return, exec, pypr toggle term && hyprctl dispatch bringactivetotop
      bind = SUPER, r, exec, pypr toggle ranger && hyprctl dispatch bringactivetotop


      bind = SUPER, grave, workspace, previous
      bind = SUPER, 1, workspace, 1
      bind = SUPER, 2, workspace, 2
      bind = SUPER, 3, workspace, 3
      bind = SUPER, 4, workspace, 4
      bind = SUPER, 5, workspace, 5
      bind = SUPER, 6, workspace, 6
      bind = SUPER, 7, workspace, 7
      bind = SUPER, 8, workspace, 8
      bind = SUPER, 9, workspace, 9
      bind = SUPER, 0, workspace, 10
      bind = SUPER_SHIFT, 1, movetoworkspace, 1
      bind = SUPER_SHIFT, 2, movetoworkspace, 2
      bind = SUPER_SHIFT, 3, movetoworkspace, 3
      bind = SUPER_SHIFT, 4, movetoworkspace, 4
      bind = SUPER_SHIFT, 5, movetoworkspace, 5
      bind = SUPER_SHIFT, 6, movetoworkspace, 6
      bind = SUPER_SHIFT, 7, movetoworkspace, 7
      bind = SUPER_SHIFT, 8, movetoworkspace, 8
      bind = SUPER_SHIFT, 9, movetoworkspace, 9
      bind = SUPER_SHIFT, 0, movetoworkspace, 10

      layerrule = blur,waybar
      layerrule = blur,rofi
       
       $scratchpadsize = size 60% 65%

       $scratchpad = class:^(scratchpad)$
       windowrulev2 = float,$scratchpad
       windowrulev2 = $scratchpadsize,$scratchpad
       windowrulev2 = workspace special silent,$scratchpad


      windowrulev2 = nomaxsize,class:^(winecfg\.exe)$
      windowrulev2 = opaque,class:^(kitty)$
      windowrulev2 = noblur,class:^(kitty)$
      windowrulev2 = opaque,class:^(waybar)$
      windowrulev2 = noblur,class:^(waybar)$
      windowrulev2 = opacity 0.3 0.3,class:^(pcmanfm)$

      # Scroll through existing workspaces with super + scroll
      bind = SUPER, mouse_down, workspace, e+1
      bind = SUPER, mouse_up, workspace, e-1

      # Move/resize windows with super + LMB/RMB and dragging
      bindm = SUPER, mouse:272, movewindow
      bindm = SUPER, mouse:273, resizewindow

      # Change volume with keys
      bindr =, XF86AudioRaiseVolume, exec, pamixer -i 5 && /home/wick3d/Downloads/Scripts/volnotification 
      bindr =, XF86AudioLowerVolume, exec, pamixer -d 5 && /home/wick3d/Downloads/Scripts/volnotification 
      bindr =, XF86AudioMute, exec, pamixer --toggle-mute && /home/wick3d/Downloads/Scripts/muted
      bindr =, XF86AudioPlay, exec, playerctl play-pause
      bindr =, XF86AudioNext, exec, playerctl next
      bindr =, XF86AudioPrev, exec, playerctl previous

      misc {
        disable_hyprland_logo = yes
        animate_manual_resizes = yes
        animate_mouse_windowdragging = yes
        focus_on_activate = yes
      }
    '';
}
