{ lib, config, ... }:
{
  options.themes.targets-vesktop.enable = lib.mkEnableOption "vesktoptheme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-vesktop.enable) {
    themes.targets."vesktop/quickCss.css" =
      "${config.home.homeDirectory}/.config/vesktop/settings/quickCss.css";
  };
}
