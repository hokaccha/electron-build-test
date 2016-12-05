#!/bin/sh

set -ex

FILE_NAME=Test-$BUILD_VERSION-darwin-x64.zip
FILE_PATH=./dist/$FILE_NAME

UPLOAD_URL=`curl -s -X POST \
-H "Authorization: token $GITHUB_ACCESS_TOKEN" \
-d "{\"tag_name\":\"$BUILD_VERSION\",\"name\":\"$BUILD_VERSION\"}" \
https://api.github.com/repos/hokaccha/electron-build-test/releases | \
jq -r '.upload_url' |
sed -e 's/{?name,label}$//g'
`
curl --data-binary @$FILE_PATH -H "Content-Type: application/zip" -H "Authorization: token $GITHUB_ACCESS_TOKEN" $UPLOAD_URL?name=$FILE_NAME
