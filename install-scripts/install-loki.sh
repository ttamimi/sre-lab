#!/usr/bin/env zsh
set -euo pipefail

VERSION=3.6.7
CMD=loki
NAME=loki-darwin-arm64
VERSION_CMD="$CMD --version"
URL="https://github.com/grafana/loki/releases/download/v$VERSION/$NAME.zip"

if (which "$CMD") && (zsh -c "$VERSION_CMD" | grep $VERSION)
then
	echo "Already installed"
else
	mkdir -p $HOME/tmp
	(cd $HOME/tmp && wget $URL && unzip $NAME.zip && rm $NAME.zip)
	mv $HOME/tmp/$NAME $HOME/bin/loki
fi
