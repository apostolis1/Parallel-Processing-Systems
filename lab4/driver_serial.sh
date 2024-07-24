#!/bin/bash

#PBS -N run_locks

## Output and error files
#PBS -e /home/parallel/parlab10/lab4/sandman_outputs/run_serial.e
#PBS -o /home/parallel/parlab10/lab4/sandman_outputs/run_serial.o

##How long should the job run for?
#PBS -l walltime=00:20:00

##Start
cd /home/parallel/parlab10/lab4


TEMP="0"
export MT_CONF=$TEMP
for LIST_SIZE in 1024 8192
do
    ./x.serial $LIST_SIZE 100 0 0 
    ./x.serial $LIST_SIZE 80 10 10 
    ./x.serial $LIST_SIZE 20 40 40
    ./x.serial $LIST_SIZE 0 50 50 
done
