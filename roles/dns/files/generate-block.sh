#!/usr/bin/env bash

set -euo pipefail

# Download the hosts file.
curl -Os https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/porn/hosts
# Put server header
echo "server:" > block.conf
# Create nx_domain zones for every entry
cat hosts | grep '^0\.0\.0\.0' | awk '{print "    local-zone: \""$2"\" always_nxdomain"}' >> block.conf
# Remove downloaded hosts
rm hosts

echo "Generated block.conf!"
