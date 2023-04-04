#! /usr/bin/env sh

# Exit if any command fails
set -e

export TERM=linux
export TERMINFO=/etc/terminfo

git config --global user.email '<>'
git config --global user.name 'CircleCI'

BUILD_DIR="build/html5"

# Get target directory to deploy new documnetation to : 
# The directory name will be the same as specific branch name
TARGET_DIR="$(git rev-parse --abbrev-ref HEAD) -v$(cat .version)"

# give permission to create node-modules
# sudo mkdir /usr/local/lib/node_modules/
# sudo mkdir /usr/local/lib/node_modules/@koumoul
# sudo chown -R $(whoami) /usr/local/lib/node_modules/

# Install dependencies
sudo npm install -g @koumoul/gh-pages-multi     # Install gh-pages-multi

# Deploy "docs" directory
gh-pages-multi deploy -s ${BUILD_DIR} -t "$TARGET_DIR"

# EOF
