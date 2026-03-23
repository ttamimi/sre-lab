#!/usr/bin/env zsh
set -euo pipefail

VERSION=0.53.0
CMD=vector
VERSION_CMD="$CMD --version"
URL="https://github.com/vectordotdev/vector/releases/download/v$VERSION/vector-$VERSION-arm64-apple-darwin.tar.gz"
EXTRACT_DIR=$HOME/tmp/vector-$VERSION

if (which "$CMD") && (zsh -c "$VERSION_CMD" | grep $VERSION)
then
	echo "Already installed"
else
	mkdir -p $EXTRACT_DIR
	curl -L $URL | tar xz -C $EXTRACT_DIR --strip-components 2 # entries in the tar file have a leading './'
	cp $EXTRACT_DIR/bin/$CMD $HOME/bin
	rm -rf $EXTRACT_DIR
fi
