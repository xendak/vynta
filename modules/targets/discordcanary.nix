{ lib, config, ... }:
{
  options.themes.targets-discordcanary.enable = lib.mkEnableOption "discordcanary theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-discordcanary.enable) {
    themes.targets."discord/settings.json_clone_1" =
      "${config.home.homeDirectory}/.config/discordcanary/settings.json";
  };
}
