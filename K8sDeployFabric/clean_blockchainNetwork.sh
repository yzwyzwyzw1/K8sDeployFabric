#!/usr/bin/env bash

KUBECONFIG_FOLDER=${PWD}/deploy

echo "clean zookeeper......"
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-zk-kafka-namespace.yaml
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-zookeeper.yaml

echo "clean kafka......"
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-kafka0.yaml
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-kafka1.yaml
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-kafka2.yaml
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-kafka3.yaml

echo "clean orderer......"
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-orderer.yaml

echo "clean peerOrg......"
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-peerOrg1.yaml
kubectl delete -f ${KUBECONFIG_FOLDER}/k8s-peerOrg2.yaml




