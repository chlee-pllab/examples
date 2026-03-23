#!/bin/bash
sizes=(
    5
    6
    7
    8
)
kernels=(
    A
    B
    C
)
for kernel in "${kernels[@]}";
do
    make sss-"$kernel"
    make o-"$kernel"
    scp libadd_kernel"$kernel".so chlee@140.114.78.64:~
    for size in "${sizes[@]}";
    do
        make m-"$size"
        make e-"$size"-"$kernel"
        scp main_1e"$size"-"$kernel".out chlee@140.114.78.64:~
        ssh chlee@140.114.78.64 make s-"$size"-"$kernel"
    done
done
