{ lib, config, ... }:
{
  options.themes.targets-zen = {
    enable = lib.mkEnableOption "zen theme target";
    profileDir = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.config/zen/${config.home.username}";
      description = "Path to your zen profile directory.";
    };
  };

  config = lib.mkIf (config.themes.enable && config.themes.targets-zen.enable) {
    themes.targets = {
      "zen/userChrome.css" = "${config.themes.targets-zen.profileDir}/chrome/userChrome.css";
      "zen/userContent.css" = "${config.themes.targets-zen.profileDir}/chrome/userContent.css";
    };
  };
}
