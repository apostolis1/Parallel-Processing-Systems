#!/bin/bash

#PBS -N run_kmeans_seq

## Output and error files
#PBS -e /home/parallel/parlab10/lab3/sandman_outputs/run_kmeans_seq.err
#PBS -o /home/parallel/parlab10/lab3/sandman_outputs/run_kmeans_seq.out

##How long should the job run for?
#PBS -l walltime=00:10:00


## Start

cd /home/parallel/parlab10/lab3
./kmeans_seq -s 16 -n 16 -c 16 -l 10


