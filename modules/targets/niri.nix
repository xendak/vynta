{ lib, config, ... }:
{
  options.themes.targets-niri.enable = lib.mkEnableOption "niri theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-niri.enable) {
    themes.targets."niri/colors.kdl" = "${config.home.homeDirectory}/.config/niri/colors.kdl";
  };
}
