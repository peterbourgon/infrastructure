#!/usr/bin/env bash
eval $(weave env)
docker run --rm -ti -v /:/rootfs -v /var/run/weave/weave.sock:/docker.sock weaveworks/kubernetes-anywhere:toolbox $*
