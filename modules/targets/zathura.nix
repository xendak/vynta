{ lib, config, ... }:
{
  options.themes.targets-zathura.enable = lib.mkEnableOption "zathura theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-zathura.enable) {
    themes.targets."zathura/zathurarc" = "${config.home.homeDirectory}/.config/zathura/zathurarc";
  };
}
