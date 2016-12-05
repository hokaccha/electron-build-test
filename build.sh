#!/bin/sh

set -ex

OUT_DIR=./dist

rm -rf $OUT_DIR

./node_modules/.bin/electron-packager . Test \
--platform=darwin \
--arch=x64 \
--overwrite \
--out=$OUT_DIR
