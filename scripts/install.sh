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

# URL for info about the latest release of the project
URL_ENDPOINT="https://api.github.com/repos/Jarmos-san/Jarvim/releases/latest"

# Download URL for the gzipped file available in the latest release
DOWNLOAD_URL=$(curl --fail --silent --show-error --location $URL_ENDPOINT \
    | grep "browser_download_url" \
    | cut -d '"' -f 4)

# Temporary directory to download the gzipped file into
DOWNLOAD_DIR=$(mktemp --directory)

################################################################################
# Clean up files & folders which aren't needed for Neovim to work properly
# Globals:
#   None
# Arguments:
#   None
################################################################################
function cleanup() {
  rm --recursive --force "$DOWNLOAD_DIR"
  echo "Cleaning up unwanted downloaded stuff!"
}

#* Ref: https://stackoverflow.com/a/34676160/8604951
trap cleanup EXIT

# Download the gzipped file to the temp directory mentioned above
curl --silent --output "$DOWNLOAD_DIR/jarvim.tar.gz" "$DOWNLOAD_URL"
echo "Downloaded Jarvim to $DOWNLOAD_DIR"

# TODO: Backup the existing Neovim configurations (if they exists)

# TODO: Extract the contents of the downloaded gzipped file
