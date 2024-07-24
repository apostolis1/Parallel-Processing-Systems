#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_kmeans_reduction_8

## Output and error files
#PBS -o /home/parallel/parlab10/lab2/kmeans/sandman_outputs/sequential/kmeans_sequential_256_16_16_10thread.out
#PBS -e /home/parallel/parlab10/lab2/kmeans/sandman_outputs/sequential/kmeans_sequential_256_16_16_10thread.err

## Taken care by our cmd 
## How many machines should we get? 
## PBS -l nodes=1:ppn=64

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)



module load openmp
cd /home/parallel/parlab10/lab2/kmeans
export OMP_NUM_THREADS=1
export GOMP_CPU_AFFINITY="0"
./kmeans_seq -s 256 -n 16 -c 16 -l 10
