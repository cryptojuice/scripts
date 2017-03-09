#!/bin/bash
# Install a custom version of Geckodriver, https://github.com/mozilla/geckodriver
#
# Add at least the following environment variables to your project configuration
# (otherwise the defaults below will be used).
# * GECKO_VERSION
#
# Include in your builds via
# \curl -sSL https://raw.githubusercontent.com/codeship/scripts/master/packages/geckodriver.sh | bash -s
GECKO_VERSION=${GECKO_VERSION:="0.15.0"}
GECKO_DIR=${GECKO_DIR:="$HOME/geckodriver"}

# fail the script on the first failing command.
set -e
CACHED_DOWNLOAD="${HOME}/cache/geckodriver-v${GECKO_VERSION}-linux64.tar.gz"

rm -rf "${GECKO_DIR}"
mkdir -p ${GECKO_DIR}
wget --continue --output-document "${CACHED_DOWNLOAD}" "https://github.com/mozilla/geckodriver/releases/download/v${GECKO_VERSION}/geckodriver-v${GECKO_VERSION}-linux64.tar.gz"
tar -xvzf "${CACHED_DOWNLOAD}" --directory "${GECKO_DIR}"
