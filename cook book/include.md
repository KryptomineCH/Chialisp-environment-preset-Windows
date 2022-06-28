# inclusions
## how to include a file
reusable code can be included into programs. The include pattern is like the following:  
```
(mod ()
; ========
; includes
; ========
    (include conditions.clib)
    (include sha256tree.clib)
; functions
; main
)
```

## path to include files
**`IMPORTANT:`** when using the `run` command, the include folder is *NOT* included automatically! It must be specified manually with the `-i path` parameter as such: `run .\example.clsp -i .\include\`

The included files should be located in the "includes" folder. When building with `cdv clsp build`, these files should are considered automatically, unless another include path is specified with -i:  
```
Project root folder
    include
        conditions.clib
        sha256tree.clib
    mySmartContract.clsp
```

## structure of include files
include files can contain constants and functions:
```
(
    ; this is a constant variable
    (defconstant CREATE_COIN_ANNOUNCEMENT 60)
    ; this is a function to include
)
```
**`IMPORTANT:`** the whole include file needs to be wrapped in parentheses!

The builder automatically only includes the code which is used in order to keep the blockchain small.

Library Files should have a file extension of `.clib`. This is technically not nessesary (yet?) but is good manners of convention.  
Additionally, .clib files cannot be compiled on their own, giving a slight advantage of control and security.
