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

###############################################################################
# Get the URL to download the latest tarball from a GitHub release
###############################################################################
URL_ENDPOINT="https://api.github.com/repos/Jarmos-san/Jarvim/releases/latest"
DOWNLOAD_URL=$(curl -fsSL $URL_ENDPOINT \
    | grep "browser_download_url" \
    | cut -d '"' -f 4)

# echo $DOWNLOAD_URL
curl -fsLO $DOWNLOAD_URL
