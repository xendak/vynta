{ lib, config, ... }:
{
  options.themes.targets-kak.enable = lib.mkEnableOption "kak theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-kak.enable) {
    themes.targets."kak/colors/current.kak" =
      "${config.home.homeDirectory}/.config/kak/colors/current.kak";
  };
}
