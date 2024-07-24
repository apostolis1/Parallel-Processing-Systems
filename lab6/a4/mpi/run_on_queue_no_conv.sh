#!/bin/bash

## Give the Job a descriptive name
#PBS -N jacobi

## Output and error files
#PBS -o gauss_no_conv_res.out
#PBS -e gauss_no_conv_res.err

## Limit memory, runtime etc.
#PBS -l walltime=00:45:00

## How many nodes:processors_per_node should we get?
#PBS -l nodes=8:ppn=8

sizes='2048 4096 6144'
##sizes='2048'
procs=(2 4 8 16 32 64)
##p##rocs=(64)
procs_dimy=(2 2 4 4 8 8)
##procs_dimy=(8)
procs_dimx=(1 2 2 4 4 8)
##procs_dimx=(8)

cd /home/parallel/parlab10/lab6/a4/mpi

module load openmpi/1.8.3

for i in {1..3}
do
    for size in $sizes
    do
        for j in ${!procs[@]}
        do 
            mpirun -np ${procs[$j]} -map-by node --mca btl tcp,self gauss_test $size $size ${procs_dimx[$j]} ${procs_dimy[$j]}
        done
    done
done
