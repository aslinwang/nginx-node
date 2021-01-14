#!/usr/bin/env bash
#
set -ex


function obtain_git_branch {
  br=`git branch | grep "*"`
  echo ${br/* /}
}
tag=`obtain_git_branch`
echo $tag

DOCKER_PROXY=$DOCKER_PROXY

sudo docker build -t ccr.ccs.tencentyun.com/aslinwang/nginx-node:$tag -f Dockerfile .
sudo docker login -u $DOCKER_USER -p $DOCKER_PSW 
sudo docker push aslinwang/nginx-node:$tag
