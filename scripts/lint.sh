#!/bin/bash
#
# lint.sh
# pwgen-swift
#
# Created by Rayhan on 2022-02-28
#

if [ "$MODE" = 'xcode' ]; then
    echo 'Linting with Xcode reporter'
    swiftlint --reporter xcode
elif [ "$MODE" = 'gh' ]; then
    echo 'Linting with Github actions reporter'
    swiftlint --reporter github-actions-logging
else
    swiftlint
fi
