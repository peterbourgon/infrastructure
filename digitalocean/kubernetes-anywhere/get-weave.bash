#!/usr/bin/env bash
sudo curl --location --silent git.io/weave --output /usr/local/bin/weave
sudo chmod +x /usr/local/bin/weave
weave launch-router --ipalloc-range=10.9.0.0/16 $*
weave launch-proxy --rewrite-inspect
weave expose -h $(hostname).weave.local
