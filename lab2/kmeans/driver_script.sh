#!/bin/bash

## Give the Job a descriptive name
#PBS -N run_kmeans_reduction_multiple


## Output and error files
#PBS -e /home/parallel/parlab10/lab2/kmeans/sandman_outputs/reduction_outputs_first_touch/cache_lane_128/run_kmeans_reduction_first_touch_256_16_16_10_mutliple_thread.err
#PBS -o /home/parallel/parlab10/lab2/kmeans/sandman_outputs/reduction_outputs_first_touch/cache_lane_128/run_kmeans_reduction_first_touch_256_16_16_10_multiple_thread.out

##How long should the job run for?
#PBS -l walltime=00:10:00


## Start
module load openmp
cd /home/parallel/parlab10/lab2/kmeans

for THREAD_NUM in 1 2 4 8 16 32 64
do
export OMP_NUM_THREADS=$(($THREAD_NUM - 1 + 1))
UPPER=$(($THREAD_NUM - 1))
export GOMP_CPU_AFFINITY="0-${UPPER}"
./kmeans_omp_reduction_first_touch -s 256 -n 16 -c 16 -l 10
done

