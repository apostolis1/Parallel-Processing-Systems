#!/bin/bash

## Give the Job a descriptive name

#PBS -N compile_test

## Output and error files
#PBS -o testjob.out
#PBS -e testjob.err

## Limit memory, runtime etc.

#PBS -l walltime=00:05:00

## How many nodes:processors_per_node should we get?
#PBS -l nodes=1:ppn=1

cd /home/parallel/parlab10/lab6/a4/mpi
module load openmpi/1.8.3
mpicc -O3 -Wall -lm mpi_gauss.c utils.c -o gauss_test
