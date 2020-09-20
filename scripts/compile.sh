#!/bin/bash

APPNAME="[app_name]"
MAIN="cmd/[main_file].go"

VERSION=`git log | head -n 1 | cut  -f 2 -d ' ' | head -c 8`
APPVERSION="$APPNAME.$VERSION"

GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o "dist/$APPVERSION" "$MAIN"

upx "dist/$APPVERSION"