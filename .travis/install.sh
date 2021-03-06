#!/bin/bash
set -o errexit -o nounset

# these are the things our CI can potentially cache for us

# the plugin SDK:  cache .sdk/
./bin/install-plugin-sdk-linux.sh

# The maven dependencies: cache $HOME/.m2
./bin/invoke-sdk.sh --quiet dependency:go-offline

echo "Size of plugin SDK: "
du -hs .sdk

echo "Size of M2 cache: "
du -hs $HOME/.m2
