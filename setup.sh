#!/usr/bin/env zsh
set -euo pipefail

echo "Creating directories"
while read DIR
do
	mkdir -p $DIR
	ls -ld $DIR
done <<EOF
$HOME/var/lib/grafana
$HOME/var/lib/loki
$HOME/var/lib/prometheus
$HOME/var/log/grafana
$HOME/var/log/multilog
$HOME/var/run/vector
$HOME/tmp
EOF
