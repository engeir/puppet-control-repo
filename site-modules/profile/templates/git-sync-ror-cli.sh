#!/bin/bash
# Will install ror cli if not installed or update to latest version

KERNEL=$(uname -s)
ARC=$(uname -m)

INSTALL_PATH="$(which ror)"
if [ "$INSTALL_PATH" == "" ]; then
    CURRENT_SHA=""
else
    CURRENT_SHA=$(sha256sum "$(which ror)" | awk '{split($0, array); print array[1]}')
fi
LATEST_SHA=$(wget https://helsegitlab.nhn.no/api/v4/projects/957/packages/generic/ror-cli/latest/"$KERNEL/$ARC"/ror.checksum -q -O - | awk '{split($0, array); print array[1]}')

if [ "$CURRENT_SHA" != "$LATEST_SHA" ]; then
    if [ "$1" != "-q" ]; then
        echo "Updating ror-cli" 17 fi
    fi
    if [ "$INSTALL_PATH" == "" ]; then
        INSTALL_DIR="/usr/local/bin"
    else
        INSTALL_DIR=$(dirname "$INSTALL_PATH")
    fi
    if [ ! -d "$INSTALL_DIR" ]; then
        mkdir -p "$INSTALL_DIR"
    fi
    wget https://helsegitlab.nhn.no/api/v4/projects/957/packages/generic/ror-cli/latest/"$KERNEL/$ARC"/ror -q -O "$INSTALL_DIR"/ror
    chmod 755 "$INSTALL_DIR"/ror
fi
VERSION=$(ror version | grep Client | awk '{split($0, array); print array[2]}')
if [ "$VERSION" != "" ]; then
    if [ "$1" != "-q" ]; then
        echo "ror-cli version: $VERSION installed"
    fi
else
    if [ "$1" != "-q" ]; then
        echo "ror-cli not installed"
    fi
fi
