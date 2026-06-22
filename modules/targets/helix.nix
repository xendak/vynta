{ lib, config, ... }:
{
  options.themes.targets-helix.enable = lib.mkEnableOption "helix theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-helix.enable) {
    themes.targets."helix/themes/current.toml" =
      "${config.home.homeDirectory}/.config/helix/themes/current.toml";
  };
}
