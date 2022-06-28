# Configuring chia
This document is derived from the official documentation: https://github.com/Chia-Network/chia-blockchain/wiki/How-to-Connect-to-the-Testnet
Due to some technical errors, this Document is targeted to ease the configuration.

## Preparations
### WARNING
It is highly recommended to set up a virtual machine for chia, especially if you have chia mainnet installed on your computer in order to not interfere with it.  
Testnet & mainnet are not easily compatible on one physical Machine!
### Notes
Multiple VMs will also allow you to configure multiple machines in order to simulate interaction with each other (EX. S1 creates a token, sends it to s1 else etc.)  
Note that a full node is required for some blockchain lookups (past coins) but for sending/receiving coins and transactions, the wallet is sufficient. Hence only one Machine requires a full node configuration.
### Installing Chia
You can follow the instructions from the official documentation: https://github.com/Chia-Network/chia-blockchain/wiki/INSTALL

## Configuring the testnet
**`WARNING:`** Doublecheck FIRST that you are not on your Mainnet machine, that you have all keys backed up and your funds are safe!  
**`WARNING:`** Doublecheck FIRST that you are not on your Mainnet machine, that you have all keys backed up and your funds are safe!  
**`WARNING:`** Doublecheck FIRST that you are not on your Mainnet machine, that you have all keys backed up and your funds are safe!  

1. After you have installed Chia, run initialize for testnet:  
```
chia init --testnet
```
2. If you had old keys present or just for good measurement, clear your keys.  
**`WARNING:`** Doublecheck FIRST that you are not on your Mainnet machine, that you have all keys backed up and your funds are safe!  
```
chia keys delete_all
```
3. If you do not have any **testnet** keys yet which you want to reuse, generate keys:  
```
chia keys generate
```
**Otherwise**, if you already have saved testnet mnemonics, you can use:
```
chia keys add
```
4. Configure chia for testnet (again, but might not be required. it worked for me though):  
```
chia configure --testnet true
```
5. finally, you can start whichever chia service you require:  
```
chia start
```