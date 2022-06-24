# Spend Bundle
a spend bundle is basically a transaction on the chia blockchain.

## example
```json
{
    "coin_spends": [
        {
            "coin": {
                "parent_coin_info": "",
                "puzzle_hash": "",
                "amount": 1000
            },
            "puzzle_reveal": "ff02ffff01ff02ffff03ffff09ffff0bff0b80ff0580ffff01ff04ffff04ff02ffff04ff17ffff04ff2fff80808080ff8080ffff01ff08ffff018c4261642070617373776f72648080ff0180ffff04ffff0133ff018080",
            "solution": ""
        }
    ],
    "aggregated_signature":"0xc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
}
```
#### coin spends
**`Note:`** coin spends could contain multiple coins
##### coin
- *`parent_coin_id`*  
    is the id (hash) of the coin that created this coin.  
    - **`Note:`** before spending, the coin needs to be created first on the blockchain by sending money to the encoded puzzle hash adress. The adress is generated in  the following way:  
    `cdv encode {puzzle_hash}` **`Note:`** add `--prefix txch` for testnet  
    - The parent coin can be obtained from the blockchain like the following:  
    `cdv rpc coinrecords --by puzhash {puzzle_hash} -nd`  
    **`Note:`** in the search result you will find the parent coin info, which you need to instert without the `0x` preset:
    `"parent_coin_info": "0xadefc..."` -> `adefc...`
- *`puzzle_hash`*   
    is the treehash of the puzzle used to spend the coin. Generated by:  
    `cdv clsp curry {sourcefile} {arguments} --treehash`
- *`amount`*  
    is the amount of mojos locked inside this coin.  
    1000 mojos equal 1 coin.  
    smallest possible coin amount: 0.001

##### puzzle info
- *`puzzle reveal`*  
    is the bytecode of this puzzle, generated with:  
    `cdv clsp curry {sourcefile} {arguments} -x`
- *`solution`*  
    is the byte code of the solution, generated with:  
    `opc '({solution})'`

#### *`aggregated signature`* [optional]
**`Note:`** The aggregated Signature must at least contain the default value `0xc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000`  

The aggregated signature is beeing generated from all the other infos.

## pushing a spend bundle to the network
1. Make sure, the spend bunle is correctly formatted:  
    `cdv inspect spendbundles {.\spend_bundle.json} -db`
2. Push the bundle:  
    `cdv rpc pushtx {.\spend_bundle.json}`