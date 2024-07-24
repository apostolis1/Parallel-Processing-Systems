#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_fw_sr_4096_128

## Output and error files
#PBS -o /home/parallel/parlab10/lab2/fw/sandman_outputs/block_size_128/run_sr_fw_4096_b128.out
#PBS -e /home/parallel/parlab10/lab2/fw/sandman_outputs/block_size_128/run_sr_fw_4096_b128.err


##How long should the job run for?
#PBS -l walltime=00:10:00

## Start 

module load openmp
cd /home/parallel/parlab10/lab2/fw

for THREAD_NUM in 1 2 4 8 16 32 64
do
export OMP_NUM_THREADS=$(($THREAD_NUM))
#./fw 1024
./fw_sr 4096 128
# ./fw_tiled <SIZE> <BSIZE>
done
