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

# echo $DOWNLOAD_URL
curl --fail --silent --location --remote-name $DOWNLOAD_URL
