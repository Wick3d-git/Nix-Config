{
  home.file.".config/neofetch/config.conf".text = ''
      print_info() {
        prin "┌───────────────────────────────┐"
        info "$(color 4) " distro
        info "$(color 4) " kernel
        prin "$(color 4) " "$(nix-store -qR /run/current-system/ | wc -l)"
        prin "$(color 4)  " "Hyprland"
        prin "$(color 4) " "AMD Ryzen 7 5700x3D"
        prin "$(color 4) " "AMD Radeon RX 6800"
        info "$(color 4) " memory
        prin "└───────────────────────────────┘"
    }
    title_fqdn="off"
    kernel_shorthand="on"
    distro_shorthand="on"
    os_arch="off"
    memory_unit="mib"
    colors=(distro)
    bold="on"
    underline_enabled="on"
    underline_char="-"
    separator=" |"
    block_range=(0 15)
    color_blocks="on"
    block_width=3
    block_height=1
    col_offset="auto"
    bar_char_elapsed="-"
    bar_char_total="="
    bar_border="on"
    bar_length=15
    bar_color_elapsed="distro"
    bar_color_total="distro"
    memory_display="off"
    battery_display="off"
    disk_display="off"
    image_backend="ascii"
    image_source="auto"
    ascii_distro="NixOS_small"
    ascii_colors=(distro)
    ascii_bold="on"
    image_loop="off"
    crop_mode="normal"
    crop_offset="center"
    image_size="auto"
    catimg_size="2"
    gap=3
    yoffset=0
    xoffset=0
    background_color=
    stdout="off"
  '';
}
