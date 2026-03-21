#!/bin/bash
cd ~/llvm-project/build
ninja -v install
cd ~/examples
make clean
make self
SRC=$(grep '^SRC *:=' Makefile | awk '{print $3}')
TARGET=${SRC%.c}.out
SO=lib${SRC%.c}.so
scp "$TARGET" chlee@140.114.78.64:~
scp "$SO" chlee@140.114.78.64:~
ssh chlee@140.114.78.64 "perf stat -e cycles ./'$TARGET'"
