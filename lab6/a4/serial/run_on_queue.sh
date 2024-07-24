#!/bin/bash

## Give the Job a descriptive name
#PBS -N runjob

## Output and error files
#PBS -o outrun_jacobi.out
#PBS -e errorrun_jacobi.err

## How many machines should we get?
#PBS -l nodes=1:ppn=1

#PBS -l walltime=00:30:00

## Start 
## Run make in the src folder (modify properly)
cd /home/parallel/parlab10/lab6/a4/serial

sizes='2048 4096 6144'

for size in $sizes
do
    ./jacobi $size     
    ##./seidelsor $size 
    ##./redblacksor $size 
done