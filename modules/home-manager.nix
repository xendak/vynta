self:
{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.themes;

  palettes = cfg.palettes;
  templates = cfg.templates;

  currTheme = "${cfg.stateDir}/.theme";
  currWallpaper = "${cfg.stateDir}/.wallpaper";

  generatedThemes = lib.mapAttrs (
    paletteName: paletteData:
    lib.foldl' lib.recursiveUpdate { } (
      lib.mapAttrsToList (
        templateName: templateFunc:
        templateFunc {
          inherit lib config pkgs;
          paletteSet = paletteData;
        }
      ) templates
    )
  ) palettes;

  themesDerivation = pkgs.runCommand "generated-themes" { } ''
    mkdir -p $out
    ${lib.concatStringsSep "\n" (
      lib.mapAttrsToList (
        themeName: themeFiles:
        lib.concatStringsSep "\n" (
          lib.mapAttrsToList (
            filePath: fileContent:
            let
              fullPath = "$out/${themeName}/${filePath}";
            in
            ''
              mkdir -p "$(dirname "${fullPath}")"
              echo -n ${lib.escapeShellArg fileContent} > "${fullPath}"
            ''
          ) themeFiles
        )
      ) generatedThemes
    )}
  '';

  vynta = pkgs.writeShellApplication {
    name = "vynta";
    runtimeInputs = with pkgs; [
      gsettings-desktop-schemas
      jq
      vivid
      nodejs
      coreutils
      gnused
    ];
    bashOptions = [
      "errexit"
      "pipefail"
    ];
    text = ''
      set -e

      THEME_NAME="$1"
      ALL_THEMES_DIR="${themesDerivation}"
      SRC_DIR="$ALL_THEMES_DIR/$THEME_NAME"

      if [[ -z "$THEME_NAME" ]]; then
        echo "Usage: vynta <theme_name>"
        echo "Available themes:"
        find "$ALL_THEMES_DIR" -maxdepth 1 -type d -printf '%f\n' | tail -n +2 | column
        exit 1
      fi

      if [[ ! -d "$SRC_DIR" ]]; then
        echo "Error: Theme '$THEME_NAME' not found."
        exit 1
      fi

      echo "Switching to theme: $THEME_NAME"
      echo "$THEME_NAME" > "${currTheme}"

      ${lib.concatStringsSep "\n" (
        lib.mapAttrsToList (
          generatedPath: targetPath:
          if lib.hasSuffix "yazi/theme.toml" targetPath then
            ''
              YDIR="$(dirname "${targetPath}")"
              mkdir -p "$YDIR"
              VIVID_THEME="$SRC_DIR/vivid/themes/current.yml"
              CURRENT_LS=$(vivid generate "$VIVID_THEME")

              GEN_SCRIPT="/tmp/yazi_gen.js"
              cat > "$GEN_SCRIPT" << 'NODEJS'
              ${builtins.readFile ../scripts/index.js}
              NODEJS

              export LS_COLORS="$CURRENT_LS"
              DYNAMIC_RULES=$(node "$GEN_SCRIPT")
              {
                cat "$SRC_DIR/yazi/theme.toml"
                echo -e "\n[filetype]\nrules = ["
                echo "$DYNAMIC_RULES"
                echo "]"
              } > "${targetPath}"
            ''
          else
            let
              cleanGeneratedPath = lib.elemAt (lib.splitString "_clone_" generatedPath) 0;
            in
            ''
              mkdir -p "$(dirname "${targetPath}")"
              sleep 0.002
              ln -sfn "$SRC_DIR/${cleanGeneratedPath}" "${targetPath}"
              echo "Linked ${targetPath}"
            ''
        ) cfg.targets
      )}

      themeTypesJson='${builtins.toJSON (lib.mapAttrs (_: p: p.type or "dark") palettes)}'
          
      ${lib.optionalString (builtins.hasAttr "gtk/settings.ini" cfg.targets)
        #bash
        ''
          THEME_TYPE=$(echo "$themeTypesJson" | jq -r ".[\"$THEME_NAME\"]")
          if [[ "$THEME_TYPE" == "dark" ]]; then
            dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
          else
            dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
          fi
        ''
      }

      ${lib.optionalString (builtins.hasAttr "caelestia/theme.txt" cfg.targets)
        #bash
        ''
          PREVIEW="/home/${config.home.username}/.local/state/caelestia/scheme/preview.txt"
          CURRENT="/home/${config.home.username}/.local/state/caelestia/scheme/current.txt"
          rm -f "$CURRENT"
          sleep 0.2
          cp -f "$PREVIEW" "$CURRENT"
        ''
      }

      ${lib.optionalString (builtins.hasAttr "emacs/themes/custom-nix-theme.el" cfg.targets)
        #bash
        ''
          emacsclient -e "(my/reload-theme)" &> /dev/null || true &
        ''
      }

      ${lib.optionalString (builtins.hasAttr "helix/themes/current.toml" cfg.targets)
        #bash
        ''
          pkill -USR1 hx &> /dev/null || true &
        ''
      }

      ${lib.optionalString (builtins.hasAttr "niri/colors.kdl" cfg.targets)
        #bash
        ''
          NIRI_CONFIG="${config.home.homeDirectory}/.config/niri/config.kdl"
          TMP_CONFIG=$(mktemp)
          { echo 'include "colors.kdl"'; cat "$NIRI_CONFIG"; } > "$TMP_CONFIG"
          mv -f "$TMP_CONFIG" "$NIRI_CONFIG"
          sed -i '/color "#00000070"/d' "$NIRI_CONFIG"
        ''
      }

      ${lib.optionalString (builtins.hasAttr "foot/colors.ini" cfg.targets)
        #bash
        ''
          SEQUENCES_FILE="$SRC_DIR/terminal/sequences.txt"
          if [[ -f "$SEQUENCES_FILE" ]]; then
            OSC_SEQUENCES=$(cat "$SEQUENCES_FILE")
            for pts in /dev/pts/[0-9]*; do
              [[ -w "$pts" ]] && printf "%b" "$OSC_SEQUENCES" > "$pts" &
            done
            printf "%b" "$OSC_SEQUENCES"
          fi
          pkill -USR1 foot &> /dev/null || true &
        ''
      }

      ${lib.optionalString (builtins.hasAttr "nushell" cfg.targets)
        # bash
        ''
            VIVID_THEME_FILE="$SRC_DIR/vivid/themes/current.yml"
            if [[ -f "$VIVID_THEME_FILE" ]]; then
              vivid generate "$VIVID_THEME_FILE" > /tmp/current_ls_colors
            elif [[ "$THEME_TYPE" == "dark" ]]; then
              vivid generate nord > /tmp/current_ls_colors
            else
              vivid generate rose-pine-dawn > /tmp/current_ls_colors
            fi
            LS_COLORS="$(cat /tmp/current_ls_colors)"
            export LS_COLORS

            cat > "${cfg.targets.nushell}" << 'NUEOF'
          # AUTO GENERATED
          let color_config = {
              separator: "light_gray"
              leading_trailing_space_bg: "#ffffff"
              header: "green"
              date: "magenta"
              filesize: "blue"
              row_index: "cyan"
              hints: "light_gray"
              string: "white"
              primitive: "white"
              int: "green"
              float: "green"
              bool: "cyan"
              nothing: "red"
              binary: "magenta"
              cellpath: "cyan"
              duration: "yellow"
              range: "yellow"
              search_result: "light_yellow"
              shape_garbage: "light_red"
              shape_bool: "light_cyan"
              shape_int: "light_green"
              shape_float: "light_green"
              shape_range: "light_yellow"
              shape_string: "light_blue"
              shape_string_interpolation: "light_cyan"
          }
          \$env.config.color_config = \$color_config
          \$env.LS_COLORS = "$LS_COLORS"
          NUEOF
        ''
      }

      if command -v ya &> /dev/null; then
        ya pub dds-ls-colors --str "$(cat /tmp/current_ls_colors)"
      fi

      echo "$(date +"%d/%m/%y | %H:%M >")" "Theme switched to $THEME_NAME." >> /tmp/vynta.log
    '';
  };

  vynta-start = pkgs.writeShellApplication {
    name = "vynta-start";
    runtimeInputs = with pkgs; [
      coreutils
      procps
      fish
      vynta
    ];
    text = ''
      if [ -f "${currTheme}" ]; then
        TARGET_THEME=$(cat "${currTheme}")
      else
        TARGET_THEME="${cfg.theme}"
      fi

      if [ -f "${currWallpaper}" ]; then
        TARGET_WALL=$(cat "${currWallpaper}")
      else
        TARGET_WALL="${cfg.wallpaper}"
      fi

      echo "$(date +"%d/%m/%y | %H:%M >")" "Starting theme: $TARGET_THEME." >> /tmp/nix-autostart

      vynta "$TARGET_THEME" &
      ${lib.optionalString (cfg.wallpaperScript != "") ''
        "${cfg.wallpaperScript}" "$TARGET_WALL"
      ''}

      ${cfg.starterExtraCommands}
    '';
  };

in
{
  options.themes = {
    enable = lib.mkEnableOption "vynta dynamic theming";

    stateDir = lib.mkOption {
      type = lib.types.str;
      default = "${config.home.homeDirectory}/.local/state/vynta";
      description = "Where vynta stores its runtime state (.theme, .wallpaper).";
    };

    theme = lib.mkOption {
      type = lib.types.str;
      default = "gorgoroth";
      description = "Default theme name.";
    };

    wallpaper = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Default wallpaper path.";
    };

    wallpaperScript = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Path to a script called with <wallpaper> on start. Leave empty to skip.";
    };

    starterExtraCommands = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Extra shell commands appended to vynta-start (for host-specific stuff like eww, battery-monitor, etc).";
    };

    palettes = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = self.builtinPalettes;
      description = "Palette definitions. Defaults to vynta built-ins. Merge to extend: themes.palettes = inputs.vynta.builtinPalettes // { my-theme = ...; };";
    };

    templates = lib.mkOption {
      type = lib.types.attrsOf lib.types.anything;
      default = self.builtinTemplates;
      description = "Template functions. Defaults to vynta built-ins.";
    };

    targets = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      description = "Mapping of generated-file paths to destination paths. Populated by per-app target modules.";
    };

  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      pkgs.vivid
      vynta
      vynta-start
    ];
  };
}
