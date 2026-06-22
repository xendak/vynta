{ lib, config, ... }:
{
  options.themes.targets-yazi.enable = lib.mkEnableOption "yazi theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-yazi.enable) {
    themes.targets."yazi/theme.toml" = "${config.home.homeDirectory}/.config/yazi/theme.toml";
  };
}
