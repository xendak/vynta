{ lib, config, ... }:
{
  options.themes.targets-foot.enable = lib.mkEnableOption "foot theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-foot.enable) {
    themes.targets."foot/colors.ini" = "${config.home.homeDirectory}/.config/foot/colors.ini";
  };
}
