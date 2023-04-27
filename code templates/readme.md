# Chia CAT2 Contract with Fee
This repository contains the necessary files to create a Chia CAT2 contract with an included fee mechanism. The fee is subtracted from the recipient and sent to a hardcoded fee address.

## Files
- `cat2_outer_puzzle_contract.clsp`: The main CAT2 contract file.
- `cat2_inner_puzzle_fee.clsp`: The inner puzzle modified to include the fee mechanism.
- `cat_truths.clib`: A Chia Lisp library containing some common truths.
- `condition_codes.clib`: A Chia Lisp library containing condition codes.
- `curry-and-treehash.clib`: A Chia Lisp library containing curry and tree hash functions.
- `utility_macros.clib`: A Chia Lisp library containing utility macros.
- `cat2_tail_fixed_genesis_by_coin_id.clsp`: The tail file.

## Environment setup

1. Install the Chia Blockchain and activate the virtual environment. (if not already)
```
git clone https://github.com/Chia-Network/chia-blockchain.git
cd chia-blockchain
sh install.sh
. ./activate
```

2. Install the Chialisp Development Environment.
```
sudo pip install --extra-index-url https://pypi.chia.net/simple/ chia-dev-tools
cdv --version
```
Note, with new versions you might need to build from the github repo.  
Instructions are at: https://github.com/Chia-Network/chia-dev-tools

## Preparations

1. Ensure that all the files in this repository are located in the same folder.  
![image](https://user-images.githubusercontent.com/12736950/234782745-393eb3b1-1fc6-4774-9f94-e05dda5b04f1.png)


2. Compile the main CAT2 contract.
```
cd path/to/contract/files
chialisp compile cat2_outer_puzzle_contract.clsp -i cat_truths.clib -i condition_codes.clib -i curry-and-treehash.clib -i utility_macros.clib -o cat2_outer_puzzle_contract.hex
```

3. Compile the inner puzzle with the fee mechanism.  
*IMPORTANT:* set the fee destination address and amount!
`chia wallet get_address`
```
chialisp compile cat2_inner_puzzle_fee.clsp -i condition_codes.clib -i curry-and-treehash.clib -i utility_macros.clib -o cat2_inner_puzzle_fee.hex
```

4. Compile the tail file.
```
chialisp compile cat2_tail_fixed_genesis_by_coin_id.clsp -o cat2_tail_fixed_genesis_by_coin_id.hex
```

5. Now you have the compiled `cat2_outer_puzzle_contract.hex`, `cat2_inner_puzzle_fee.hex`, and `cat2_tail_fixed_genesis_by_coin_id.hex` files. You can use these files to create the final coin according to your specific requirements.

## Create CAT

1. To create the CAT, you need the `cat2_outer_puzzle_contract.hex`, `cat2_inner_puzzle_fee.hex`, and `cat2_tail_fixed_genesis_by_coin_id.hex` files from the previous steps.

2. make sure chia is set up ant a your wallet is synchronized

3. Create a new wallet for the CAT.
```
chia wallet add_cat_wallet
```

Take note of the wallet ID returned by this command. You will need it in the following steps.

4. Make sure you have enough XCH in your main wallet to cover the transaction fees and initial supply. Then, create the CAT using the command below. Replace `WALLET_ID` with the wallet ID from step 3, `AMOUNT` with the desired initial supply, and `CAT_NAME` with the name of your CAT.

```
chia wallet create_cat -w WALLET_ID -a AMOUNT -n CAT_NAME -i cat2_outer_puzzle_contract.hex -p cat2_inner_puzzle_fee.hex -t cat2_tail_fixed_genesis_by_coin_id.hex
``` 

5. The command above will generate a CAT with the desired initial supply and a 1% fee mechanism. The transaction may take some time to be confirmed by the network. Once the transaction is confirmed, your CAT is created and you can start using it.

## Transfer CAT

1. To transfer the CAT, you will need the wallet ID for the CAT wallet and the recipient's address. You can transfer the CAT by using the following command. Replace `WALLET_ID` with the wallet ID of the CAT wallet, `RECIPIENT_ADDRESS` with the recipient's address, and `AMOUNT` with the amount of CAT you want to transfer.

```
chia wallet send -w WALLET_ID -a AMOUNT -t RECIPIENT_ADDRESS
```  
*Note:* RECIPIENT_ADDRESS refers to the main wallets chia address

2. The command above will initiate the CAT transfer. Note that a 1% fee will be subtracted from the recipient's amount and sent to the hardcoded fee address.

## Check CAT Balance

You can check the balance of your CAT wallet using the following command. Replace `WALLET_ID` with the wallet ID of your CAT wallet.

```
chia wallet get_balance -w WALLET_ID
```

This command will display the balance of your CAT wallet, including both the spendable and pending balance.
