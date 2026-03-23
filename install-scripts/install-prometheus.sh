#!/usr/bin/env zsh
set -euo pipefail

# The Prometheus package consists of a single binary `prometheus` and a utility
# `promtool`, plus a basic configuration file `prometheus.yaml`, which we will
# ingore because we have our own.

VERSION=3.7.3
CMD=prometheus
VERSION_CMD="$CMD --version"
URL="https://github.com/prometheus/prometheus/releases/download/v$VERSION/prometheus-$VERSION.darwin-arm64.tar.gz"
EXTRACT_DIR=$HOME/tmp/prometheus-$VERSION

if (which "$CMD") && (zsh -c "$VERSION_CMD" | grep $VERSION)
then
	echo "Already installed"
else
	mkdir -p $EXTRACT_DIR
	curl -L $URL | tar xz -C $EXTRACT_DIR --strip-components 1
	cp $EXTRACT_DIR/{prometheus,promtool} $HOME/bin
	rm -rf $EXTRACT_DIR
fi
