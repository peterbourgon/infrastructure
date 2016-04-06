#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/toolbox.bash setup-kubelet-volumes
docker run -d --name=kubelet    --privileged=true --net=host --pid=host --volumes-from=kubelet-volumes weaveworks/kubernetes-anywhere:kubelet
docker run -d --name=kube-proxy --privileged=true --net=host --pid=host                                weaveworks/kubernetes-anywhere:proxy
