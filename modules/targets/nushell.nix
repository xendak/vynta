{ lib, config, ... }:
{
  options.themes.targets-nushell = {
    enable = lib.mkEnableOption "nushell theme target";
    file = lib.mkOption {
      type = lib.types.str;
      description = "Path to write the auto-generated nushell colors file.";
    };
  };

  config = lib.mkIf (config.themes.enable && config.themes.targets-nushell.enable) {
    themes.targets."nushell" = config.themes.targets-nushell.file;
  };
}
