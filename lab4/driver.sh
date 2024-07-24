#!/bin/bash

#PBS -N run_locks

## Output and error files
#PBS -e /home/parallel/parlab10/lab4/sandman_outputs/run_cgl.e
#PBS -o /home/parallel/parlab10/lab4/sandman_outputs/run_cgl.o

##How long should the job run for?
#PBS -l walltime=00:20:00

##Start
module load openmp
cd /home/parallel/parlab10/lab4

for THREADS in 1 2 4 8 16 32 64 128
do
    TEMP="0"
    if [[ $THREADS -le 64 ]]
    then
        for ((c=1; c<$THREADS; c++))
        do
            TEMP+=",${c}"
        done
    else
        for ((c=1; c<64; c++))
        do
            TEMP+=",${c}"
        done
        TEMP+=",0"
        for ((c=1; c<64; c++))
        do
            TEMP+=",${c}"
        done
    fi
    export MT_CONF=$TEMP
    for LIST_SIZE in 1024 8192
    do
        ./x.cgl $LIST_SIZE 100 0 0 
        ./x.cgl $LIST_SIZE 80 10 10 
        ./x.cgl $LIST_SIZE 20 40 40
        ./x.cgl $LIST_SIZE 0 50 50 
    done
done