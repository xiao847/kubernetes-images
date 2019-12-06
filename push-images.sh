#!/bin/bash

for imagepath in $(cat ./imagepath.txt)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到阿里云仓库
docker tag $imagepath registry.cn-shanghai.aliyuncs.com/k8s_nfyg/$imagename
docker pushregistry.cn-shanghai.aliyuncs.com/k8s_nfyg/$imagename
