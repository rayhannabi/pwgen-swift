#!/bin/bash
#
# tool.sh
# pwgen-swift
#
# Created by Rayhan on 2022-02-28
#

RED='\033[0;31m'
NC='\033[0m'

mkdir -p .build/report

slather coverage \
    --scheme PwgenSwift-Package \
    --binary-basename PwgenSwift \
    --source-directory Sources/PwgenSwift \
    --build-directory .build/derived \
    --output-directory .build/report \
    --cobertura-xml \
    --verbose \
    PwgenSwift.xcodeproj

REPORT_PATH=$(find .build/report -name '*.xml' -print -quit)

if [ ! "$REPORT_PATH" ]; then
    echo -e "${RED}Error generating coverage report${NC}"
    exit 1
else
    echo "Report saved: $REPORT_PATH"
fi
