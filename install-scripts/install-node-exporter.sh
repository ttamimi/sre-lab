#!/usr/bin/env zsh
set -euo pipefail

VERSION=1.10.2
CMD=node_exporter
VERSION_CMD="$CMD --version"
URL="https://github.com/prometheus/node_exporter/releases/download/v$VERSION/node_exporter-$VERSION.darwin-arm64.tar.gz"
EXTRACT_DIR=$HOME/tmp/node-exporter-$VERSION

if (which "$CMD") && (zsh -c "$VERSION_CMD" | grep $VERSION)
then
	echo "Already installed"
else
	mkdir -p $EXTRACT_DIR
	curl -L $URL | tar xz -C $EXTRACT_DIR --strip-components 1
	cp $EXTRACT_DIR/$CMD $HOME/bin
	rm -rf $EXTRACT_DIR
fi
