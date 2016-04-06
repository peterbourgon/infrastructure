#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
$DIR/toolbox.bash setup-kubelet-volumes
$DIR/toolbox.bash compose -p kube pull
$DIR/toolbox.bash compose -p kube up -d
$DIR/toolbox.bash kubectl create -f skydns-addon
