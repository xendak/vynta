{ lib, config, ... }:
{
  options.themes.targets-picode = {
    enable = lib.mkEnableOption "picode theme target";
    targetPath = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.pi/agent/themes";
      description = "Path where picode/pi themes are deployed.";
    };
  };

  config = lib.mkIf (config.themes.enable && config.themes.targets-picode.enable) {
    themes.targets = {
      "picode/themes/current.json" = "${config.themes.targets-picode.targetPath}/current.json";
    };
  };
}
