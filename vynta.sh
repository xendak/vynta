#!/bin/bash
THEME_NAME="$1"
ALL_THEMES_DIR="./result/"
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
echo "$THEME_NAME" >"/home/xendak/Flake/.theme"

mkdir -p "$(dirname "/home/xendak/.local/state/caelestia/scheme/preview.txt")"
sleep 0.002
ln -sfn "$SRC_DIR/caelestia/theme.txt" "/home/xendak/.local/state/caelestia/scheme/preview.txt"
echo "Linked /home/xendak/.local/state/caelestia/scheme/preview.txt"

mkdir -p "$(dirname "/home/xendak/.config/discordcanary/settings.json")"
sleep 0.002
ln -sfn "$SRC_DIR/discord/settings.json" "/home/xendak/.config/discordcanary/settings.json"
echo "Linked /home/xendak/.config/discordcanary/settings.json"

mkdir -p "$(dirname "/home/xendak/.config/emacs/themes/custom-nix-theme.el")"
sleep 0.002
ln -sfn "$SRC_DIR/emacs/themes/custom-nix-theme.el" "/home/xendak/.config/emacs/themes/custom-nix-theme.el"
echo "Linked /home/xendak/.config/emacs/themes/custom-nix-theme.el"

mkdir -p "$(dirname "/home/xendak/.local/share/fcitx5/themes/current/highlight.svg")"
sleep 0.002
ln -sfn "$SRC_DIR/fcitx5/highlight.svg" "/home/xendak/.local/share/fcitx5/themes/current/highlight.svg"
echo "Linked /home/xendak/.local/share/fcitx5/themes/current/highlight.svg"

mkdir -p "$(dirname "/home/xendak/.local/share/fcitx5/themes/current/panel.svg")"
sleep 0.002
ln -sfn "$SRC_DIR/fcitx5/panel.svg" "/home/xendak/.local/share/fcitx5/themes/current/panel.svg"
echo "Linked /home/xendak/.local/share/fcitx5/themes/current/panel.svg"

mkdir -p "$(dirname "/home/xendak/.local/share/fcitx5/themes/current/theme.conf")"
sleep 0.002
ln -sfn "$SRC_DIR/fcitx5/theme.conf" "/home/xendak/.local/share/fcitx5/themes/current/theme.conf"
echo "Linked /home/xendak/.local/share/fcitx5/themes/current/theme.conf"

mkdir -p "$(dirname "/home/xendak/.config/foot/colors.ini")"
sleep 0.002
ln -sfn "$SRC_DIR/foot/colors.ini" "/home/xendak/.config/foot/colors.ini"
echo "Linked /home/xendak/.config/foot/colors.ini"

mkdir -p "$(dirname "/home/xendak/.config/fzf/colors")"
sleep 0.002
ln -sfn "$SRC_DIR/fzf/colors" "/home/xendak/.config/fzf/colors"
echo "Linked /home/xendak/.config/fzf/colors"

mkdir -p "$(dirname "/home/xendak/.config/gtk-3.0/gtk.css")"
sleep 0.002
ln -sfn "$SRC_DIR/gtk/gtk.css" "/home/xendak/.config/gtk-3.0/gtk.css"
echo "Linked /home/xendak/.config/gtk-3.0/gtk.css"

mkdir -p "$(dirname "/home/xendak/.config/gtk-3.0/gtk-dark.css")"
sleep 0.002
ln -sfn "$SRC_DIR/gtk/gtk.css" "/home/xendak/.config/gtk-3.0/gtk-dark.css"
echo "Linked /home/xendak/.config/gtk-3.0/gtk-dark.css"

mkdir -p "$(dirname "/home/xendak/.config/gtk-4.0/gtk.css")"
sleep 0.002
ln -sfn "$SRC_DIR/gtk/gtk.css" "/home/xendak/.config/gtk-4.0/gtk.css"
echo "Linked /home/xendak/.config/gtk-4.0/gtk.css"

mkdir -p "$(dirname "/home/xendak/.config/gtk-4.0/gtk-dark.css")"
sleep 0.002
ln -sfn "$SRC_DIR/gtk/gtk.css" "/home/xendak/.config/gtk-4.0/gtk-dark.css"
echo "Linked /home/xendak/.config/gtk-4.0/gtk-dark.css"

mkdir -p "$(dirname "/home/xendak/.config/gtk-3.0/settings.ini")"
sleep 0.002
ln -sfn "$SRC_DIR/gtk/settings.ini" "/home/xendak/.config/gtk-3.0/settings.ini"
echo "Linked /home/xendak/.config/gtk-3.0/settings.ini"

mkdir -p "$(dirname "/home/xendak/.config/gtk-4.0/settings.ini")"
sleep 0.002
ln -sfn "$SRC_DIR/gtk/settings.ini" "/home/xendak/.config/gtk-4.0/settings.ini"
echo "Linked /home/xendak/.config/gtk-4.0/settings.ini"

mkdir -p "$(dirname "/home/xendak/.config/gtk-2.0/gtkrc")"
sleep 0.002
ln -sfn "$SRC_DIR/gtk/settings.ini" "/home/xendak/.config/gtk-2.0/gtkrc"
echo "Linked /home/xendak/.config/gtk-2.0/gtkrc"

mkdir -p "$(dirname "/home/xendak/.config/helix/themes/current.toml")"
sleep 0.002
ln -sfn "$SRC_DIR/helix/themes/current.toml" "/home/xendak/.config/helix/themes/current.toml"
echo "Linked /home/xendak/.config/helix/themes/current.toml"

mkdir -p "$(dirname "/home/xendak/.config/kak/colors/current.kak")"
sleep 0.002
ln -sfn "$SRC_DIR/kak/colors/current.kak" "/home/xendak/.config/kak/colors/current.kak"
echo "Linked /home/xendak/.config/kak/colors/current.kak"

mkdir -p "$(dirname "/home/xendak/.config/lazygit/config.yml")"
sleep 0.002
ln -sfn "$SRC_DIR/lazygit/config.yml" "/home/xendak/.config/lazygit/config.yml"
echo "Linked /home/xendak/.config/lazygit/config.yml"

mkdir -p "$(dirname "/home/xendak/.config/niri/colors.kdl")"
sleep 0.002
ln -sfn "$SRC_DIR/niri/colors.kdl" "/home/xendak/.config/niri/colors.kdl"
echo "Linked /home/xendak/.config/niri/colors.kdl"

mkdir -p "$(dirname "/home/xendak/.config/nvim/colors.vim")"
sleep 0.002
ln -sfn "$SRC_DIR/nvim/colors.vim" "/home/xendak/.config/nvim/colors.vim"
echo "Linked /home/xendak/.config/nvim/colors.vim"

mkdir -p "$(dirname "/home/xendak/Documents/Notes/xendak/.obsidian/themes/shiki.json")"
sleep 0.002
ln -sfn "$SRC_DIR/obsidian/shiki.json" "/home/xendak/Documents/Notes/xendak/.obsidian/themes/shiki.json"
echo "Linked /home/xendak/Documents/Notes/xendak/.obsidian/themes/shiki.json"

mkdir -p "$(dirname "/home/xendak/Documents/Notes/xendak/.obsidian/snippets/material-theme.css")"
sleep 0.002
ln -sfn "$SRC_DIR/obsidian/theme.css" "/home/xendak/Documents/Notes/xendak/.obsidian/snippets/material-theme.css"
echo "Linked /home/xendak/Documents/Notes/xendak/.obsidian/snippets/material-theme.css"

mkdir -p "$(dirname "/home/xendak/.config/qt5ct/colors/current.conf")"
sleep 0.002
ln -sfn "$SRC_DIR/qt/colors.conf" "/home/xendak/.config/qt5ct/colors/current.conf"
echo "Linked /home/xendak/.config/qt5ct/colors/current.conf"

mkdir -p "$(dirname "/home/xendak/.config/qt6ct/colors/current.conf")"
sleep 0.002
ln -sfn "$SRC_DIR/qt/colors.conf" "/home/xendak/.config/qt6ct/colors/current.conf"
echo "Linked /home/xendak/.config/qt6ct/colors/current.conf"

mkdir -p "$(dirname "/home/xendak/.local/share/color-schemes/current.colors")"
sleep 0.002
ln -sfn "$SRC_DIR/qt/current.colors" "/home/xendak/.local/share/color-schemes/current.colors"
echo "Linked /home/xendak/.local/share/color-schemes/current.colors"

mkdir -p "$(dirname "/home/xendak/.config/kdeglobals")"
sleep 0.002
ln -sfn "$SRC_DIR/qt/kdeglobals" "/home/xendak/.config/kdeglobals"
echo "Linked /home/xendak/.config/kdeglobals"

mkdir -p "$(dirname "/home/xendak/.config/qt5ct/qt5ct.conf")"
sleep 0.002
ln -sfn "$SRC_DIR/qt/qt.conf" "/home/xendak/.config/qt5ct/qt5ct.conf"
echo "Linked /home/xendak/.config/qt5ct/qt5ct.conf"

mkdir -p "$(dirname "/home/xendak/.config/qt6ct/qt6ct.conf")"
sleep 0.002
ln -sfn "$SRC_DIR/qt/qt.conf" "/home/xendak/.config/qt6ct/qt6ct.conf"
echo "Linked /home/xendak/.config/qt6ct/qt6ct.conf"

mkdir -p "$(dirname "/home/xendak/.config/rofi/config.rasi")"
sleep 0.002
ln -sfn "$SRC_DIR/rofi/config.rasi" "/home/xendak/.config/rofi/config.rasi"
echo "Linked /home/xendak/.config/rofi/config.rasi"

mkdir -p "$(dirname "/home/xendak/.config/rofi/fullscreen-preview.rasi")"
sleep 0.002
ln -sfn "$SRC_DIR/rofi/fullscreen-preview.rasi" "/home/xendak/.config/rofi/fullscreen-preview.rasi"
echo "Linked /home/xendak/.config/rofi/fullscreen-preview.rasi"

mkdir -p "$(dirname "/home/xendak/.config/rofi/powermenu.rasi")"
sleep 0.002
ln -sfn "$SRC_DIR/rofi/powermenu.rasi" "/home/xendak/.config/rofi/powermenu.rasi"
echo "Linked /home/xendak/.config/rofi/powermenu.rasi"

mkdir -p "$(dirname "/home/xendak/.config/vesktop/settings/quickCss.css")"
sleep 0.002
ln -sfn "$SRC_DIR/vesktop/quickCss.css" "/home/xendak/.config/vesktop/settings/quickCss.css"
echo "Linked /home/xendak/.config/vesktop/settings/quickCss.css"

mkdir -p "$(dirname "/home/xendak/.config/wezterm/colors/current.lua")"
sleep 0.002
ln -sfn "$SRC_DIR/wezterm/colors/current.lua" "/home/xendak/.config/wezterm/colors/current.lua"
echo "Linked /home/xendak/.config/wezterm/colors/current.lua"

YDIR="$(dirname "/home/xendak/.config/yazi/theme.toml")"
mkdir -p "$YDIR"
VIVID_THEME="$SRC_DIR/vivid/themes/current.yml"
CURRENT_LS=$(vivid generate "$VIVID_THEME")

GEN_SCRIPT="/tmp/yazi_gen.js"
cat >"$GEN_SCRIPT" <<'NODEJS'
// Credits: Mellbourn
// https://github.com/Mellbourn/lsColorsToToml
// TODO: eventually rewrite this in nix
"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const MODES = ["bold",
    "underline",
    "blink",
    "blink_rapid",
    "reversed",
    "hidden",
    "crossed"
];
const modes = {
    1: "bold",
    4: "underline",
    5: "blink",
    6: "blink_rapid",
    7: "reversed",
    8: "hidden",
    9: "crossed",
};
const fgColors = {
    30: "black",
    31: "red",
    32: "green",
    33: "yellow",
    34: "blue",
    35: "magenta",
    36: "cyan",
    37: "gray",
    90: "darkgray",
    91: "lightred",
    92: "lightgreen",
    93: "lightyellow",
    94: "lightblue",
    95: "lightmagenta",
    96: "lightcyan",
};
const bgColors = {
    40: "black",
    41: "red",
    42: "green",
    43: "yellow",
    44: "blue",
    45: "magenta",
    46: "cyan",
    47: "gray",
    100: "darkgray",
    101: "lightred",
    102: "lightgreen",
    103: "lightyellow",
    104: "lightblue",
    105: "lightmagenta",
    106: "lightcyan",
};
const lsColorsContent = process.argv[2] || process.env.LS_COLORS;

// Helper function to convert RGB to Hex
function rgbToHex(r, g, b) {
    return `#${[r, g, b].map((x) => x.toString(16).padStart(2, "0")).join("")}`;
}
// Generate the 256-color palette
function generate256ColorPalette() {
    const palette = {};
    // Generate the 6x6x6 color cube
    for (let r = 0; r < 6; r++) {
        for (let g = 0; g < 6; g++) {
            for (let b = 0; b < 6; b++) {
                const index = 16 + r * 36 + g * 6 + b;
                palette[index] = rgbToHex((r ? 55 : 0) + r * 40, (g ? 55 : 0) + g * 40, (b ? 55 : 0) + b * 40);
            }
        }
    }
    // Generate the grayscale spectrum
    for (let i = 0; i < 24; i++) {
        const shade = 8 + i * 10;
        const index = 232 + i;
        palette[index] = rgbToHex(shade, shade, shade);
    }
    return palette;
}
const palette = generate256ColorPalette();
// Function to convert ANSI code to hex, now more robust
function ansiCodeToHex(code) {
    let colors = {};
    if (!code) {
        return {}; // Return empty if no code provided
    }
    const parts = code.split(";").map(p => parseInt(p, 10));
    for (let i = 0; i < parts.length; i++) {
        // Check if the current part is '38', indicating a foreground color code
        if (parts[i] == 38) {
            // 5 indicates 256 color palette
            if (parts[i + 1] == 5) {
                const colorIndex = parts[i + 2];
                if (!isNaN(colorIndex)) {
                    // Ensure that the color index is a number
                    colors.fg = palette[colorIndex] || "#ffffff"; // Assign foreground color
                    i += 2; // Skip the next two parts as they have been processed
                }
            }
            // 2 indicates 24-bit RGB color
            else if (parts[i + 1] == 2) {
                const [r, g, b] = parts.slice(i + 2, i + 5);
                colors.fg = rgbToHex(r, g, b);
                i += 4;
            }
        }
        // Check if the current part is '48', indicating a background color code
        else if (parts[i] == 48) {
            // 5 indicates 256 color palette
            if (parts[i + 1] == 5) {
                const colorIndex = parts[i + 2];
                if (!isNaN(colorIndex)) {
                    // Ensure that the color index is a number
                    colors.bg = palette[colorIndex] || "#ffffff"; // Assign background color
                    i += 2; // Skip the next two parts as they have been processed
                }
            }
            // 2 indicates 24-bit RGB color
            else if (parts[i + 1] == 2) {
                const [r, g, b] = parts.slice(i + 2, i + 5);
                colors.bg = rgbToHex(r, g, b);
                i += 4;
            }
        }
        else if (parts[i] == 0) {
            // reset
            colors = {};
        }
        else if (parts[i] in modes) {
            const mode = modes[parts[i]];
            colors[mode] = true;
        }
        else if (parts[i] in fgColors) {
            const color = fgColors[parts[i]];
            colors.fg = color;
        }
        else if (parts[i] in bgColors) {
            const color = bgColors[parts[i]];
            colors.bg = color;
        }
    }
    return colors;
}
function lsPatternToYazi(lsColorsPattern) {
    if (lsColorsPattern.length < 3) {
        const patternMap = {
            di: { url: "*/" },
            bd: { url: "*", is: "block" },
            cd: { url: "*", is: "char" },
            ex: { url: "*", is: "exec" },
            pi: { url: "*", is: "fifo" },
            ln: { url: "*", is: "link" },
            or: { url: "*", is: "orphan" },
            so: { url: "*", is: "sock" },
            st: { url: "*", is: "sticky" }
        };
        const mappedPattern = patternMap[lsColorsPattern];
        if (mappedPattern) {
            return mappedPattern;
        }
        return { url: "" };
    }
    else {
        return { url: lsColorsPattern };
    }
}
// Parse LS_COLORS and convert to theme.toml content, now handling potential undefined codes
function convertLsColorsToToml(lsColors) {
    const entries = lsColors.split(":");
    const rules = entries
        .map((entry) => {
        const [pattern, codes] = entry.split("=", 2); // Ensure only the first '=' is used to split
        const { url, is } = lsPatternToYazi(pattern);
        if (!url)
            return "";
        const style = ansiCodeToHex(codes);
        const { fg, bg } = style;
        const ruleParts = [];
        ruleParts.push(`url = "${url}"`);
        if (is)
            ruleParts.push(`is = "${is}"`);
        if (fg)
            ruleParts.push(`fg = "${fg}"`);
        if (bg)
            ruleParts.push(`bg = "${bg}"`);
        for (let mode of MODES) {
            if (style[mode])
                ruleParts.push(`${mode} = true`);
        }
        // Only produce a rule if there's more than just the name
        if (ruleParts.length > 1) {
            return `  { ${ruleParts.join(", ")} }`;
        }
        else {
            return null;
        }
    })
        // Filter out entries without colors
        .filter((rule) => rule);
    return rules.join(",\n") + ",";
}
const themeTomlContent = convertLsColorsToToml(lsColorsContent);
console.log(themeTomlContent);
// Optionally, write to a file
// fs.writeFileSync('theme.toml', themeTomlContent);
//# sourceMappingURL=index.js.map

NODEJS

export LS_COLORS="$CURRENT_LS"
DYNAMIC_RULES=$(node "$GEN_SCRIPT")
{
  cat "$SRC_DIR/yazi/theme.toml"
  echo -e "\n[filetype]\nrules = ["
  echo "$DYNAMIC_RULES"
  echo "]"
} >"/home/xendak/.config/yazi/theme.toml"

mkdir -p "$(dirname "/home/xendak/.config/zathura/zathurarc")"
sleep 0.002
ln -sfn "$SRC_DIR/zathura/zathurarc" "/home/xendak/.config/zathura/zathurarc"
echo "Linked /home/xendak/.config/zathura/zathurarc"

mkdir -p "$(dirname "/home/xendak/.config/zellij/themes/default.kdl")"
sleep 0.002
ln -sfn "$SRC_DIR/zellij/default.kdl" "/home/xendak/.config/zellij/themes/default.kdl"
echo "Linked /home/xendak/.config/zellij/themes/default.kdl"

mkdir -p "$(dirname "/home/xendak/.config/zen/xendak/chrome/userChrome.css")"
sleep 0.002
ln -sfn "$SRC_DIR/zen/userChrome.css" "/home/xendak/.config/zen/xendak/chrome/userChrome.css"
echo "Linked /home/xendak/.config/zen/xendak/chrome/userChrome.css"

mkdir -p "$(dirname "/home/xendak/.config/zen/xendak/chrome/userContent.css")"
sleep 0.002
ln -sfn "$SRC_DIR/zen/userContent.css" "/home/xendak/.config/zen/xendak/chrome/userContent.css"
echo "Linked /home/xendak/.config/zen/xendak/chrome/userContent.css"

themeTypesJson='{"archdaemon":"dark","gorgoroth":"dark","handmadehero":"dark","nier":"light","nier-dark":"dark","nord":"dark","odysseus":"dark"}'

THEME_TYPE=$(echo "$themeTypesJson" | jq -r ".[\"$THEME_NAME\"]")
if [[ "$THEME_TYPE" == "dark" ]]; then
  dconf write /org/gnome/desktop/interface/color-scheme "'prefer-dark'"
else
  dconf write /org/gnome/desktop/interface/color-scheme "'prefer-light'"
fi

PREVIEW="/home/xendak/.local/state/caelestia/scheme/preview.txt"
CURRENT="/home/xendak/.local/state/caelestia/scheme/current.txt"
rm -f "$CURRENT"
sleep 0.2
cp -f "$PREVIEW" "$CURRENT"

emacsclient -e "(my/reload-theme)" &>/dev/null || true &

pkill -USR1 hx &>/dev/null || true &

NIRI_CONFIG="/home/xendak/.config/niri/config.kdl"
TMP_CONFIG=$(mktemp)
{
  echo 'include "colors.kdl"'
  cat "$NIRI_CONFIG"
} >"$TMP_CONFIG"
mv -f "$TMP_CONFIG" "$NIRI_CONFIG"
sed -i '/color "#00000070"/d' "$NIRI_CONFIG"

SEQUENCES_FILE="$SRC_DIR/terminal/sequences.txt"
if [[ -f "$SEQUENCES_FILE" ]]; then
  OSC_SEQUENCES=$(cat "$SEQUENCES_FILE")
  for pts in /dev/pts/[0-9]*; do
    [[ -w "$pts" ]] && printf "%b" "$OSC_SEQUENCES" >"$pts" &
  done
  printf "%b" "$OSC_SEQUENCES"
fi
pkill -USR1 foot &>/dev/null || true &

VIVID_THEME_FILE="$SRC_DIR/vivid/themes/current.yml"
if [[ -f "$VIVID_THEME_FILE" ]]; then
  vivid generate "$VIVID_THEME_FILE" >/tmp/current_ls_colors
elif [[ "$THEME_TYPE" == "dark" ]]; then
  vivid generate nord >/tmp/current_ls_colors
else
  vivid generate rose-pine-dawn >/tmp/current_ls_colors
fi
LS_COLORS="$(cat /tmp/current_ls_colors)"
export LS_COLORS

cat >"/home/xendak/Flake/home/common/programs/terminal/nushell/colors.nu" <<'NUEOF'
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
$env.config.color_config = $color_config
$env.LS_COLORS = "$LS_COLORS"
NUEOF

if command -v ya &>/dev/null; then
  ya pub dds-ls-colors --str "$(cat /tmp/current_ls_colors)"
fi

echo "$(date +"%d/%m/%y | %H:%M >")" "Theme switched to $THEME_NAME." >>/tmp/vynta.log
