#!/bin/bash
#
# test.sh
# pwgen-swift
#
# Created by Rayhan on 2022-02-28
#

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}Generating xcodeproj${NC}"

swift package generate-xcodeproj

echo -e "${YELLOW}Running tests${NC}"

xcodebuild test \
    -scheme PwgenSwift-Package \
    -derivedDataPath .build/derived \
    -destination platform=macOS \
    -enableCodeCoverage YES
