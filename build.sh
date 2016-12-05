#!/bin/sh

set -ex

OUT_DIR=./dist

rm -rf $OUT_DIR

./node_modules/.bin/electron-packager . Test \
--platform=darwin \
--arch=x64 \
--overwrite \
--app-version=$BUILD_VERSION \
--build-version=$BUILD_VERSION \
--out=$OUT_DIR

cd dist
zip -qry Test-$BUILD_VERSION-darwin-x64.zip Test-darwin-x64
