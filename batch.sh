#!/bin/bash
sizes=(
    09
)
kernels=(
    A
)
#RESULTS_DIR="perf_$(date +%Y%m%d_%H%M%S)"
#mkdir -p "$RESULTS_DIR"
for kernel in "${kernels[@]}";
do
    echo "size,task_clock_ms" > "summary$kernel.csv"
    for size in "${sizes[@]}";
    do
        make sss-"$size"-"$kernel"
        make o-"$size"-"$kernel"
        scp lib_layer_norm_fwd_fused_1e"$size"-"$kernel".so chlee@140.114.78.64:~
        make m-"$size"
        make e-"$size"-"$kernel"
        scp main_1e"$size"-"$kernel".out chlee@140.114.78.64:~
        #ssh chlee@140.114.78.64 make l-"$size"-"$kernel"
        ssh chlee@140.114.78.64 "perf stat -e task-clock ./main_1e${size}-${kernel}.out" 2>&1 | tee >(awk '/task-clock/ {gsub(/,/,"",$1); print "'$size'," $1}' >> "summary$kernel.csv")
        cat "summary$kernel.csv"
    done
done
