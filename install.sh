#!/usr/bin/env sh
#
###############################################################################
# Script to install Jarvim
###############################################################################
#
###############################################################################
# License: MIT License
# Author:  Somraj Saha
###############################################################################

set -e pipefail

# URL for info about the latest release of the project
URL_ENDPOINT="https://api.github.com/repos/Jarmos-san/Jarvim/releases/latest"

# Download URL for the gzipped file available in the latest release
DOWNLOAD_URL=$(curl --fail --silent --show-error --location $URL_ENDPOINT \
    | grep "browser_download_url" \
    | cut -d '"' -f 4)

# TODO: Create a temp directory to download the gzipped file

# TODO: Refactor the following command to download the asset to the aforementioned temporary directory
curl --fail --silent --location --remote-name $DOWNLOAD_URL

# TODO: Write a function to perform cleanup tasks

# TODO: Register the cleanup function to be called on the EXIT signal
#* Ref: https://stackoverflow.com/a/34676160/8604951
trap cleanup EXIT
