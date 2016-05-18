#!/usr/bin/env fish

docker run -d --name=consul --net=host gliderlabs/consul-server -bootstrap -advertise=(ifconfig|grep '10\.'|grep inet|cut -d':' -f2|awk '{print $1}')
