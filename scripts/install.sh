#!/usr/bin/env bash
################################################################################
#                       Jarvim Installation Script                             #
#                                                                              #
# Use this script to install, configure & setup a Neovim development           #
# environment on your local machine. It's supposed to be used as a one-click   #
# solution to all your IDE-like needs on Neovim (and in the terminal)!         #
#                                                                              #
################################################################################
################################################################################
################################################################################
#                                                                              #
# Copyright (C) 2022-Present Somraj Saha                                       #
#                                                                              #
# The contents of this script are licensed under the open-source MIT license.  #
# So, feel free to share, copy, distribute the contents of this script as your #
# wish. Accredition isn't a requirement but much appreciated!                  #
#                                                                              #
# For more information on the licensing details, please refer to the *LICENSE* #
#                                                                              #
################################################################################
################################################################################
################################################################################

set -Eeuo pipefail

trap cleanup SIGINT SIGTERM ERR EXIT

################################################################################
################################################################################
#                                                                              #
# Prints a helpful "usage guide" whenever needed                               #
#                                                                              #
# GLOBALS:                                                                     #
#   None                                                                       #
#                                                                              #
# ARGUMENTS:                                                                   #
#   None                                                                       #
#                                                                              #
# OUTPUTS:                                                                     #
#   Write a helpful "usage guide" to STDOUT                                    #
#                                                                              #
# RETURNS:                                                                     #
#   None                                                                       #
#                                                                              #
################################################################################
################################################################################
function usage() {
  cat << EOF
  Usage: $(basename "${BASH_SOURCE[0]}") [-h] [-v] [-f]

  Install, configure & setup Jarvim with a single command using this script!

  Available options:
  -h, --help      Print this help and exit
  -v, --verbose   Print script debug info
EOF
  exit
}

################################################################################
################################################################################
#                                                                              #
# Cleanup function to be invoked when or if script is terminated, errored out, #
# completed with exit code 0.                                                  #
#                                                                              #
# GLOBALS:                                                                     #
#   None                                                                       #
#                                                                              #
# ARGUMENTS:                                                                   #
#   None                                                                       #
#                                                                              #
# OUTPUTS:                                                                     #
#   None                                                                       #
#                                                                              #
# RETURNS:                                                                     #
#   None                                                                       #
#                                                                              #
################################################################################
################################################################################
function cleanup() {
  trap - SIGINT SIGTERM ERR EXIT

  rm --recursive --force "$DOWNLOAD_DIR"

  unset URL_ENDPOINT DOWNLOAD_URL DOWNLOAD_DIR
}

################################################################################
################################################################################
#                                                                              #
# Functional wrapper to setup colour codes for the script to be used elsewhere #
#                                                                              #
# GLOBALS:                                                                     #
#   None                                                                       #
#                                                                              #
# ARGUMENTS:                                                                   #
#   None                                                                       #
#                                                                              #
# OUTPUTS:                                                                     #
#   None                                                                       #
#                                                                              #
# RETURNS:                                                                     #
#   None                                                                       #
#                                                                              #
# Reference materials:                                                         #
# - https://dev.to/ifenna__/adding-colors-to-bash-scripts-48g4                 #
# - https://tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html                         #
#                                                                              #
################################################################################
################################################################################
# function setup_colors() {
#   if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
#     NOCOLOR='\e[0m' RED='\e[0;31m' GREEN='\e[0;32m' ORANGE='\e[0;33m' \
#     BLUE='\e[0;34m' PURPLE='\e[0;35m' CYAN='\e[0;36m' YELLOW='\e[1;33m'
#   else
#     NOCOLOR='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
#   fi
# }

################################################################################
################################################################################
#                                                                              #
# Function wrapper to print messages to the STDERROR properly                  #
#                                                                              #
# GLOBALS:                                                                     #
#   None                                                                       #
#                                                                              #
# ARGUMENTS:                                                                   #
#   None                                                                       #
#                                                                              #
# OUTPUTS:                                                                     #
#   Prints a specified message to STDERROR                                     #
#                                                                              #
# RETURNS:                                                                     #
#   None                                                                       #
#                                                                              #
################################################################################
################################################################################
function msg() {
  echo >&2 -e "${1-}"
}

################################################################################
################################################################################
#                                                                              #
# Functional wrapper to "kill the script's execution" when needed              #
#                                                                              #
# GLOBALS:                                                                     #
#   None                                                                       #
#                                                                              #
# ARGUMENTS:                                                                   #
#   msg:  (position) A message to print to STDOUT                              #
#   code: (position) An exit code (default is 1)                               #
#                                                                              #
# OUTPUTS:                                                                     #
#   A specified message which should be passed as arguments                    #
#                                                                              #
# RETURNS:                                                                     #
#   None                                                                       #
#                                                                              #
################################################################################
################################################################################
function die() {
  local msg=$1
  local code=${2-1}
  msg "$msg"
  exit "$code"
}

################################################################################
################################################################################
#                                                                              #
# Functional wrapper to parse parameters of the script                         #
#                                                                              #
# GLOBALS:                                                                     #
#   flags: Some flags that you should pass to the script                       #
#   param: Some parameters to pass to the script                               #
#                                                                              #
# ARGUMENTS:                                                                   #
#   msg:  (position) A message to print to STDOUT                              #
#   code: (position) An exit code (default is 1)                               #
#                                                                              #
# OUTPUTS:                                                                     #
#   A specified message which should be passed as arguments                    #
#                                                                              #
# RETURNS:                                                                     #
#   True if parsing was successful                                             #
#                                                                              #
################################################################################
################################################################################
function parse_params() {

  while :; do
    case "${1-}" in
    -h | --help) usage ;;
    -v | --verbose) set -x ;;
    --no-color) NO_COLOR=1 ;;
    -?*) die "Unknown option: $1" ;;
    *) break ;;
    esac
    shift
  done

  return 0
}

parse_params "$@"
# setup_colors

# URL for info about the latest release of the project
URL_ENDPOINT="https://api.github.com/repos/Jarmos-san/Jarvim/releases/latest"

# Download URL for the gzipped file available in the latest release
DOWNLOAD_URL=$(curl --fail --silent --show-error --location $URL_ENDPOINT \
    | grep "browser_download_url" \
    | cut -d '"' -f 4)

# Temporary directory to download the gzipped file into
DOWNLOAD_DIR=$(mktemp --directory)

# Download the gzipped file to the temp directory mentioned above
curl --silent --output "$DOWNLOAD_DIR/jarvim.tar.gz" "$DOWNLOAD_URL"
echo "Downloaded Jarvim to $DOWNLOAD_DIR"

if [[ -d "$HOME/.config/nvim" ]]; then
  echo "Found existing Neovim configs, creating a backup."
  tar --create --gzip --file="$HOME/.backups/nvim.tgz" "$HOME/.config/nvim"
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  mkdir -p "$HOME/.config/nvim"
fi

echo "Extracting Jarvim configs to $HOME/.config/nvim"

tar --extract --file="$DOWNLOAD_DIR/jarvim.tar.gz"

# Copy only the contents of the "configs" directory to the destination.
# See this StackExchange thread for more info: https://askubuntu.com/a/86891
cp --archive "jarvim/configs/." "$HOME/.config/nvim"
