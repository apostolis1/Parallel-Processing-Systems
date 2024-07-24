#!/bin/bash

## Give the Job a descriptive name
#PBS -N jacobi

## Output and error files
#PBS -o gauss_conv.out
#PBS -e gauss_conv.err

## Limit memory, runtime etc.
#PBS -l walltime=00:15:00

## How many nodes:processors_per_node should we get?
#PBS -l nodes=8:ppn=8

cd /home/parallel/parlab10/lab6/a4/mpi

module load openmpi/1.8.3

# for i in {1..3}
# do
mpirun -np 64 -map-by node --mca btl tcp,self gauss_test 1024 1024 8 8
# done
