#!/bin/bash
#
# docc.sh
# pwgen-swift
#
# Created by Rayhan on 2022-02-19
#

RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

cleanup() {
    if [[ "$TEMPDIR" || -d "$TEMPDIR" ]]; then
        rm -rf "$TEMPDIR"
        echo "Cleaned up $TEMPDIR"
    fi
}

docc() {
    TEMPDIR=$(mktemp -d)

    if [[ ! "$TEMPDIR" || ! -d "$TEMPDIR" ]]; then
        echo -e "${RED}Could not create temporary directory${NC}"
        exit 1
    fi

    TARGET="PwgenSwift"
    DERIVED_DATA="$TEMPDIR/$TARGET"
    ARCHIVE="$TARGET.doccarchive"
    ARCHIVE_PATH="$DERIVED_DATA/Build/Products/Debug/$ARCHIVE"

    echo "Generating DocC archive"
    echo "Path: $ARCHIVE_PATH"

    xcodebuild docbuild \
        -scheme $TARGET \
        -derivedDataPath $DERIVED_DATA \
        -destination platform=macOS,arch=x86_64 |
        xcpretty

    rm -rf $SRCDIR/docs
    mkdir -p $SRCDIR/docs
    cp -R $ARCHIVE_PATH $SRCDIR/docs/$ARCHIVE
}

jazz() {
    jazzy \
        --clean \
        --output $SRCDIR/docs \
        --swift-build-tool spm \
        --disable-search \
        --min-acl internal \
        --theme apple
}

trap cleanup EXIT

SRCDIR="$(realpath $0)"
SRCDIR="${SRCDIR///scripts\/docc.sh/}"

echo -e "${YELLOW}Generating docs${NC}"

if [ "$MODE" = 'docc' ]; then
    docc
else
    jazz
fi
