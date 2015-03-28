#
# Base16 Shell
#

function b16 () {
  local theme="$1";
  local mode="$2";
  local def="$BASE16_LOCATION/base16-$theme.$mode.sh"
  if [[ -s $def ]]; then
    . $def
    export BASE16_SCHEME="$theme"
    export BASE16_MODE="$mode"
  fi
}

function b16t () {
  b16 "$1" "$BASE16_MODE"
}

function b16m () {
  b16 "$BASE16_SCHEME" "$1"
}
