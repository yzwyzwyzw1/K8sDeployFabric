# 简介

本版本为基础测试版，非正式部署版本，证书部署版本将才有k8s+helm.

# 部署测试

1. 修改 `orderer.yaml` 的 `hostPath` 对应到本目录中的 `crypto-config` 和 `channel-artifacts`
2. 启动网络： `./setup_blockchainNetwork.sh`,关闭网络：`./clean_blockchainNetwork.sh`
3. 启动网络后的部署测试`kubectl exec -it cli-59444ddfc6-6cxgz -n  org1-example-com /bin/bash`，其中，cli-59444ddfc6-6cxgz为真实pod名字，可通过kubectl get pods -n org1-example-com,查看，进入cli之后，执行命令`./scripts/script.sh`进行合约测试。


## 说明

1. 由于 k8s 的 service 网络访问的域名是通过 namespace 来构成的,而 fabric 中 orderer 或 peer 等节点的域名是预先定义在组织里的，而且必须通过这里的域名来互相通信，所以就需要将这里的域名和 namespace 设置成相同的
2. 集群没有配置数据的持久化，您可自行根据业务调整持久化类型

