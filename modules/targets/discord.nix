{ lib, config, ... }:
{
  options.themes.targets-discord.enable = lib.mkEnableOption "discord theme target";

  config = lib.mkIf (config.themes.enable && config.themes.targets-discord.enable) {
    themes.targets."discord/settings.json" =
      "${config.home.homeDirectory}/.config/discord/settings.json";
  };
}
