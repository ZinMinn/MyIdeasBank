#!/usr/bin/env bash

# Exit if any command fails
set -e

git config --global user.email "info.zinminn29@gmail.com"
git config --global user.name 'Zin Minn'

BUILD_DIR="build/html5"

# Get target directory to deploy new documnetation to : 
# The directory name will be the same as specific branch name
TARGET_DIR="$(git rev-parse --abbrev-ref HEAD) -v$(cat .version)"

# Install dependencies
yarn global add @koumoul/gh-pages-multi     # Install gh-pages-multi

# Deploy "docs" directory
yarn exec gh-pages-multi -- deploy -s ${BUILD_DIR} -t "$TARGET_DIR"

# EOF