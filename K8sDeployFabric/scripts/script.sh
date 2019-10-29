CHANNEL_NAME="mychannel"
peer channel create -o orderer0.example-com:7050 -c $CHANNEL_NAME -f ../channel-artifacts/channel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem
sleep 5s
peer channel join -b mychannel.block
sleep 5s
peer chaincode install -n mycc -v 1.0 -p github.com/hyperledger/fabric/peer/chaincode/example/
sleep 5s
peer chaincode instantiate -o orderer0.example-com:7050 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem -C $CHANNEL_NAME -n mycc -v 1.0 -c '{"Args":["init","a", "100", "b","200"]}'
sleep 10s
peer chaincode invoke -o orderer0.example-com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem -C $CHANNEL_NAME -n mycc --peerAddresses peer0.org1-example-com:7051 --tlsRootCertFiles /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/peerOrganizations/org1-example-com/peers/peer0.org1-example-com/tls/ca.crt -c '{"Args":["invoke","a","b","10"]}'
sleep 5s
peer chaincode query -C $CHANNEL_NAME -n mycc -c '{"Args":["query","a"]}'


peer chaincode invoke -o orderer0.example-com:7050 --tls true --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example-com/orderers/orderer0.example-com/msp/tlscacerts/tlsca.example-com-cert.pem -C $CHANNEL_NAME -n mycc  -c '{"Args":["delete","a"]}'