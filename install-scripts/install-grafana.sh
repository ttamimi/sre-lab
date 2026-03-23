#!/usr/bin/env zsh
set -euo pipefail

VERSION=12.4.0
CMD=$HOME/opt/grafana/bin/grafana
VERSION_CMD="$CMD --version"
URL="https://dl.grafana.com/grafana/release/$VERSION/grafana_${VERSION}_22325204712_darwin_arm64.tar.gz"

if (which "$CMD") && (zsh -c "$VERSION_CMD" | grep $VERSION)
then
	echo "Already installed"
else
	mkdir -p $HOME/opt $HOME/tmp
	curl -L $URL | tar xz -C $HOME/tmp
	mv -f $HOME/tmp/grafana-${VERSION} $HOME/opt/grafana
fi
