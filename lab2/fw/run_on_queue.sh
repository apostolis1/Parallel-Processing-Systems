#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_fw

## Output and error files
#PBS -o /home/parallel/parlab10/lab2/fw/sandman_outputs/sequential/run_fw_simple_64.out
#PBS -e /home/parallel/parlab10/lab2/fw/sandman_outputs/sequential/run_fw_simple_64.err

## How many machines should we get? 
##PBS -l nodes=1:ppn=8

##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 
## Run make in the src folder (modify properly)

module load openmp
cd /home/parallel/parlab10/lab2/fw
export OMP_NUM_THREADS=1

for SIZE in 1024 2048 4096
do
./fw ${SIZE}
done
# ./fw_sr 1024 64
# ./fw_tiled <SIZE> <BSIZE>