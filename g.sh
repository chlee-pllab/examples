#!/bin/bash
cd ~/llvm-project/build
ninja -v install
cd ~/examples
#make clean
#make compile
#make s
make i
#rm test.ll
#scp ./test chlee@140.114.78.64:~/
#ssh chlee@140.114.78.64 ./test
