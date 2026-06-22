{ lib, config, ... }:
{
  options.themes.targets-dunst.enable = lib.mkEnableOption "dunst theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-dunst.enable) {
    themes.targets."dunst/dunstrc" = "${config.home.homeDirectory}/.config/dunst/dunstrc";
  };
}
