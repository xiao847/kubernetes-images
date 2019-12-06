#!/bin/bash
#push google or coreos images to dockerhub or aliyun registry,
#change the registry name and username/password to yourself's.

ALI_REGISTRY=registry.cn-shanghai.aliyuncs.com/k8s_nfyg

#config the following env at travis-ui
docker login registry.cn-shanghai.aliyuncs.com -u $ALI_USERNAME  -p $ALI_PASSWORD

for image in $(cat img-list.txt)
do
	imagename=$(echo $image | awk -F '/' '{print $NF}')
	docker pull $image
	docker tag $image $ALI_REGISTRY/$imagename
	# push到阿里云仓库
	docker push $ALI_REGISTRY/$imagename
done
