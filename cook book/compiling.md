# compiling
Chialisp code can be compiled into a hex file with the following command (in the virtual environment):
``` cmd
cdv clsp build sourcefile.clsp
```

- result will be `sourcefile.clsp.hex`
- the content might be `ff02ffff01ff02.....`  

## Usages 
- this is what actually goes on to the Blockchain
- hex file can be used for currying input