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

trap cleanup SIGINT SIGTERM ERR EXIT

# TODO: Write a usage guide function to invoke when necessary

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
  unset DEPENDENCIES
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
################################################################################
################################################################################
function setup_colors() {
  if [[ -t 2 ]] && [[ -z "${NO_COLOR-}" ]] && [[ "${TERM-}" != "dumb" ]]; then
    NOCOLOR='\e[0m' RED='\e[0;31m' GREEN='\e[0;32m' ORANGE='\e[0;33m' \
    BLUE='\e[0;34m' PURPLE='\e[0;35m' CYAN='\e[0;36m' YELLOW='\e[1;33m'
  else
    NOCOLOR='' RED='' GREEN='' ORANGE='' BLUE='' PURPLE='' CYAN='' YELLOW=''
  fi
}

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
#   None                                                                       #
#                                                                              #
# ARGUMENTS:                                                                   #
#   None                                                                       #
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

  # args=("$@")

  # # check required params and arguments
  # [[ ${#args[@]} -eq 0 ]] && die "Missing script arguments"

  return 0
}

parse_params "$@"
setup_colors

# TODO: Check for neovim as well once the following issue has been fixed
#* https://github.com/kdabir/has/issues/64

DEPENDENCIES=("curl" "tar" "gcc" "git")

echo -e "Performing dependency checks!\n"

for DEPENDENTS in "${DEPENDENCIES[@]}"; do
  curl --silent --location "https://git.io/_has" | bash -s "$DEPENDENTS"
done

echo -e "\nDependency checks complete! If a dependecy is missing from your system please install it before downloading Jarvim."
