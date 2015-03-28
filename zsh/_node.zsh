#
# Auto completes the executables located in node_modules/.bin
#
function npmbin () {
  PATH=$(npm bin):$PATH $@
}
function _comp_npmbin () {
  _arguments '1: :->command_'
  case $state in
    command_)
      _files -W "$(npm bin)" -/
      ;;
    *)
      _files
      ;;
  esac
}
compdef _comp_npmbin npmbin


