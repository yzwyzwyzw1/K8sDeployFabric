#!/usr/bin/env bash

cryptogen generate  --config ./crypto-config.yaml  --output  crypto-config
export FABRIC_CFG_PATH=$PWD
export CHANNEL_NAME=mychannel
configtxgen  -profile TwoOrgsOrdererGenesis  -outputBlock ./channel-artifacts/genesis.block
configtxgen  -profile TwoOrgsChannel -outputCreateChannelTx  ./channel-artifacts/mychannel.tx  -channelID $CHANNEL_NAME
configtxgen  -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP
configtxgen  -profile TwoOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org2MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org2MSP
