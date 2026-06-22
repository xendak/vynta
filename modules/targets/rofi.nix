{ lib, config, ... }:
{
  options.themes.targets-rofi.enable = lib.mkEnableOption "rofi theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-rofi.enable) {
    themes.targets = {
      "rofi/config.rasi" = "${config.home.homeDirectory}/.config/rofi/config.rasi";
      "rofi/fullscreen-preview.rasi" =
        "${config.home.homeDirectory}/.config/rofi/fullscreen-preview.rasi";
      "rofi/powermenu.rasi" = "${config.home.homeDirectory}/.config/rofi/powermenu.rasi";
    };
  };
}
