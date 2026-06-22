{ lib, config, ... }:
{
  options.themes.targets-eww.enable = lib.mkEnableOption "eww theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-eww.enable) {
    themes.targets = {
      "eww/colors.scss" = "${config.home.homeDirectory}/.config/eww/colors.scss";
      "eww/colors.yuck" = "${config.home.homeDirectory}/.config/eww/colors.yuck";
    };
  };
}
