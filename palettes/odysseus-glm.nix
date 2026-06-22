{ lib, ... }:
let
  lazy = false;
  must = {
    primary = "#8FCFF3";
    secondary = "#5e81ac";
    tertiary = "#8fbcbb";
    error = "#bf616a";

    fg = "#e5e9f0";
    bg = "#20242c";
    surface_container = "#2e3440";
    surface_container_low = "#171a20";
    surface_container_high = "#171a20";

    dim = "#4C566A";

    cursor_bg = "#e3556f";
    cursor_fg = "#171a20";

  };

  overrides = {
    primary = "#E06C75";
    on_primary = "#2E0507";
    primary_container = "#7C2838";
    on_primary_container = "#FFEEED";
    inverse_primary = "#90283A";
    primary_fixed = "#FFDAD9";
    primary_fixed_dim = "#E0B3B7";
    on_primary_fixed = "#2E0507";
    on_primary_fixed_variant = "#7C2838";

    secondary = "#B6C4D8";
    on_secondary = "#0A1220";
    secondary_container = "#2D3A4E";
    on_secondary_container = "#EEF4FC";
    secondary_fixed = "#D1DFF0";
    secondary_fixed_dim = "#B6C4D8";
    on_secondary_fixed = "#0A1220";
    on_secondary_fixed_variant = "#2D3A4E";

    tertiary = "#5B9BF0";
    on_tertiary = "#001A35";
    tertiary_container = "#163050";
    on_tertiary_container = "#EEF4FF";
    tertiary_fixed = "#D0E2FF";
    tertiary_fixed_dim = "#A4C7FF";
    on_tertiary_fixed = "#001A35";
    on_tertiary_fixed_variant = "#163050";

    error = "#FF8A80";
    on_error = "#2E0507";
    error_container = "#7C2D1F";
    on_error_container = "#FFEFEC";

    background = "#090E1A";
    foreground = "#E1E7EF";
    bg = "#090E1A";
    fg = "#E1E7EF";

    on_background = "#E1E7EF";
    surface = "#0F1523";
    on_surface = "#E1E7EF";
    surface_variant = "#1C2536";
    on_surface_variant = "#8899AF";

    surface_dim = "#06090E";
    surface_bright = "#2E406B";
    surface_container_lowest = "#030407";
    surface_container_low = "#0B0F19";
    surface_container = "#0F1524";
    surface_container_high = "#172036";
    surface_container_highest = "#202D4B";

    dim = "#1C2536";
    outline = "#384658";
    outline_variant = "#1C2536";
    inverse_surface = "#E1E7EF";
    inverse_on_surface = "#1A2332";

    surface_tint = "#E06C75";
    shadow = "#000000";
    scrim = "#000000";
    source_color = "#E06C75";

    black = "#3B4252";
    red = "#BF616A";
    green = "#A3BE8C";
    yellow = "#EBCB8B";
    blue = "#5E81AC";
    magenta = "#B48EAD";
    cyan = "#8FBCBB";
    white = "#E5E9F0";
    gray = "#a89984";
    orange = "#D08770";

    brightblack = "#4C566A";
    brightred = "#C5727A";
    brightgreen = "#B1C89D";
    brightyellow = "#EFD49F";
    brightblue = "#81A1C1";
    brightmagenta = "#BE9DB8";
    brightcyan = "#9FC6C5";
    brightwhite = "#E5E9F0";
    brightgray = "#928374";
    brightorange = "#D79784";
  };

in
{
  isLazy = lazy;
  slug = "odysseus-glm";
  name = "odysseus-glm";
  type = "dark";
  author = "xendak";
  must = must;
  overrides = overrides;
}
