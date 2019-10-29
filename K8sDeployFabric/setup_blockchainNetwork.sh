#!/bin/bash

echo "deploy zk-kafka-namespace......"
kubectl apply -f deploy/k8s-zk-kafka-namespace.yaml

echo "deploy zookeeper......"
kubectl apply -f deploy/k8s-zookeeper.yaml
sleep 5

echo "deploy kafka0......"
kubectl apply -f deploy/k8s-kafka0.yaml
echo "deploy kafka1......"
kubectl apply -f deploy/k8s-kafka1.yaml
echo "deploy kafka2......"
kubectl apply -f deploy/k8s-kafka2.yaml
echo "deploy kafka3......"
kubectl apply -f deploy/k8s-kafka3.yaml
sleep 5

echo "deploy orderer......"
kubectl apply -f deploy/k8s-orderer.yaml
sleep 5

echo "deploy peerOrg1......"
kubectl apply -f deploy/k8s-peerOrg1.yaml
echo "deploy peerOrg2......"
kubectl apply -f deploy/k8s-peerOrg2.yaml
