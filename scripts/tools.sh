#!/bin/bash
#
# tool.sh
# pwgen-swift
#
# Created by Rayhan on 2022-02-28
#

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

program_exists() {
    if ! command -v $1 &>/dev/null; then
        echo -e "${RED}Error: $1 could not be found${NC}"
        exit 1
    else
        echo "$1 found: $(command -v $1)"
    fi
}

echo -e "${YELLOW}Checking tools${NC}"
program_exists brew
program_exists gem
program_exists jazzy
program_exists xcpretty
program_exists swiftformat
program_exists swiftlint
program_exists swift
program_exists xcodebuild
