#!/bin/bash

set -ex

# set default values if vars are not set
BUILD_DIR="${BUILD_DIR:-/tmp/prebid}"
BUILD_TARGET="${BUILD_TARGET:-/var/result}"
BUILD_STAGE="${BUILD_STAGE:-dev}"
PREBID_JS_SOURCE="${PREBID_JS_SOURCE:-https://github.com/prebid/Prebid.js.git}"
PREBID_JS_BRANCH="${PREBID_JS_BRANCH:-master}"

# clone prebid.js source
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}"
cd "${BUILD_DIR}"
echo "Using ${BUILD_DIR} as build directory"
git clone "${PREBID_JS_SOURCE}"
cd Prebid.js
git checkout "${PREBID_JS_BRANCH}"

# build Prebid.JS bundle
npm install -sq
gulp "build-bundle-${BUILD_STAGE}"

# copy result to target location
ls -alR build/dev/prebid.js
cp build/dev/prebid.js "${BUILD_TARGET}"
