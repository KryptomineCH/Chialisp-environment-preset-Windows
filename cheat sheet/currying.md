# currying
Currying can be used to preinsert arguments in functions. This allows to omit hardcoding variables in code.

## Example
``` clsp
(mod ( ; function input arguments
        PASSWORD_HASH ; capital letters means curried value
        password
        receive_puzzlehash
        transaction_amount
    )
    (
        ; do something
    )
)
```
This is inherently a bad function as anyone could generate a password hash from a password, and transmit both password hash and password into the puzzle to unlock it.  
Rather than hardcoding a password hash into the puzzle so it can only be unlocked with one given password, the variable `PASSWORD_HASH` can be curried in.

## How to use curry
``` cmd
cdv clsp curry ./passwordprotect.clsp.hex -a 0x1234664553
```
any amount of arguments could be curried:  
``` cmd
cdv clsp curry ./passwordprotect.clsp.hex -a 0x1234664553 -a mypassword -a 0xa11ce -a 1000
```
Arguments can only be passed in the order of the function arguments!

## how to use a curried puzzle
The puzzle from the example would have been used like this:  
```
brun ./passwordprotect.clsp "(0xMyPasswordHash MyPassword 0xa11ce 1000)"
```

The password hash has been curried in, so `0xMyPasswordHash` is now fixed in the puzzle. The puzzle must now be solved with one less argument:  
The puzzle from the example would have been used like this:
```
brun ./passwordprotect_curried.clsp "(MyPassword 0xa11ce 1000)"
```