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

# TODO: Write a functional wrapper to introduce coloured STDOUT of the script

# TODO: Write function wrapper to write messages instead of using "echo"

# TODO: Write functional wrapper to kill the script when needed

# TODO: Write functional wrapper to parse the parameters of the script

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

# TODO: Backup the existing Neovim configurations (if they exists)

# TODO: Extract the contents of the downloaded gzipped file
