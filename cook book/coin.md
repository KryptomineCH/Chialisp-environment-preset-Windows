# Coin
> from: https://chialisp.com/docs/getting_started/first_smart_coin#coins

## What is a coin on the chia blockchain?
Everything on the Chia Blockchain, including the standard transactions used to move money between wallets, is a coin. 
Coins are identified by their id, which is just a sha256 hashed representation of the following three components:

- *`parent_coin_id`*  
    which is the id of the coin that created this one.
- *`puzzle_hash`*  
    which is the hash of the puzzle used to spend the coin.
- *`amount`*  
    which is the amount of money locked with the coin, in mojos (a trillionth of an XCH).

Multiple coins can have the same puzzle hash, and a coin can create multiple children. 
**`IMPORTANT:`** No two coins can have the same parent, puzzle hash, and amount, as their ids would be the same.

A coin can be spent by revealing its puzzle and providing a solution. The solution is then passed to its puzzle, which outputs a list of conditions.

## Creating a coin
A coin can be created when you have created a puzzle (which can be solved) with chialisp.
1. Create the puzzle and save it as `{mypuzzle}.clsp`
2. Create test your puzzle with:
    1. run {mypuzzle}.clsp
    2. brun "{run result}" "({myarguments})"
3. Compile the puzzle.clsp as stated in compiling.md (resulting in a puzzle.clsp.hex file)
    `cdv clsp build {mypuzzle}.clsp`
4. You need to argument and get the puzzlehash with the following command:  
    `cdv clsp curry {sourcefile}.clsp.hex {-a augment arguments} --treehash`
5. You need to encode the puzzlehash to a coin address:  
    `cdv encode {puzzle_hash}` (mainnet)  
    `cdv encode {puzzle_hash} --prefix txch` (testnet)
6. You can send a transaction to the coin's wallet address obtained in step 2  
    `chia wallet send -t {coin address} -a 0.000000001`  
    **`Note:`** 0.000000001 equals 1000 mojo  
    **`IMPORTANT:`** On the testnet, make sure that the puzzle is actually resolvable, otherwise you won't be able to unlock the coins locked balance again!
7. Once the transaction has been confirmed, you can obtain the coin's details by using the following command:  
    `cdv rpc coinrecords --by puzhash {puzzle_hash} -nd`

## Unlocking / spending a coin
a coin can be unlocked / spent with a spend_bundle. More info in spend_bundle.md