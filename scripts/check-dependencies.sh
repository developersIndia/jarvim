#!/usr/bin/env bash

###############################################################################
# Script to check if all dependencies for Jarvim are available or not
###############################################################################
#
###############################################################################
# License: MIT License
# Author:  Somraj Saha
###############################################################################

# TODO: Check for neovim as well once the following issue has been fixed
#* https://github.com/kdabir/has/issues/64

DEPENDENCIES=("curl" "tar" "gcc" "git")

echo -e "Performing dependency checks!\n"

for DEPENDENTS in ${DEPENDENCIES[@]}; do
  curl --silent --location "https://git.io/_has" | bash -s $DEPENDENTS
done

echo -e "\nDependency checks complete! If a dependecy is missing from your system please install it before downloading Jarvim."
