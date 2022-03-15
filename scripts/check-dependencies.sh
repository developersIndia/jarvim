#!/usr/bin/env bash
################################################################################
#               Jarvim Dependencies Checking Script                            #
#                                                                              #
# Use this script to check all the dependencies necessary for Neovim to work   #
# properly with Jarvim's configs are available on the location machine.        #
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

# TODO: Check for neovim as well once the following issue has been fixed
#* https://github.com/kdabir/has/issues/64

DEPENDENCIES=("curl" "tar" "gcc" "git")

echo -e "Performing dependency checks!\n"

for DEPENDENTS in "${DEPENDENCIES[@]}"; do
  curl --silent --location "https://git.io/_has" | bash -s "$DEPENDENTS"
done

echo -e "\nDependency checks complete! If a dependecy is missing from your system please install it before downloading Jarvim."
