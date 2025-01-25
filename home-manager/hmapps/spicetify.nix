{
  pkgs,
  lib,
  inputs,
  ...
}:
{
  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplayMod
        adblock
        hidePodcasts
        shuffle
        playNext
        playlistIcons
        fullAlbumDate
        volumePercentage
      ];
      enabledCustomApps = with spicePkgs.apps; [
        lyricsPlus
      ];

      #theme = spicePkgs.themes.sleek;
      #colorScheme = "nord";
    };
}
