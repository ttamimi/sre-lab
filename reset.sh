#!/usr/bin/env zsh
set -euo pipefail

while read DIR
do
	if [[ `ls -A $DIR` ]]
	then
		rm -rf $DIR/*
		echo "deleted all contents of $DIR"
	else
		echo "$DIR is already empty"
	fi
done <<EOF
$HOME/var/lib/grafana
$HOME/var/lib/loki
$HOME/var/lib/prometheus
$HOME/var/log/grafana
$HOME/var/log/multilog
$HOME/var/run/vector
EOF

echo "deleting daemontools supervise directories"
find services -name supervise -type d -exec rm -r "{}" \+
