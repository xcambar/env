#
# Base16 Shell
#

function b16 () {
  local theme="$1";
  local mode=".$2";
  local def="$BASE16_LOCATION/scripts/base16-$theme$mode.sh"
  local def_simple="$BASE16_LOCATION/scripts/base16-$theme.sh"
  if [[ -s $def ]]; then
    . "$def"
    export BASE16_SCHEME="$theme"
    export BASE16_MODE="$mode"
  elif [[ -s $def_simple ]]; then
    . "$def_simple"
    export BASE16_SCHEME="$theme"
    export BASE16_MODE=""
  fi
}

function b16t () {
  b16 "$1" "$BASE16_MODE"
}

function b16m () {
  b16 "$BASE16_SCHEME" "$1"
}
